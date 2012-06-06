class CourseController < ApplicationController
  #CRUD Function
  before_filter :find_course, :only=> [:showUserTeachingCourse,:editCourse,:updateCourse,:destroyCourse]
  #before_filter :find_course, :only=> [:show]#,:edit,:update,:destroy]
  def index
      @course=Coursecontent.all	  
  end

  def upload  
         fileName = Coursecontent.save(params[:course])
         name = /(.*)(\.ppt|\.pptx)/.match(fileName)[1]
         filePath = "#{Rails.root}/public/data/#{session[:user].username}/#{name}/#{name}"
         command1 = "unoconv #{Rails.root}/public/data/#{fileName}"
         command2 = "convert -quality 100 -density 300x300 #{Rails.root}/public/data/#{name}.pdf #{Rails.root}/public/data/#{session[:user].username}/#{name}/#{name}.jpg"
         @channel = "/#{session[:user].username}/#{name}"
         fork do 
           system "mkdir #{Rails.root}/public/data/#{session[:user].username}"
           system "mkdir #{Rails.root}/public/data/#{session[:user].username}/#{name}"
           system command1
           system command2
           pages = `ls #{Rails.root}/public/data/#{session[:user].username}/#{name} | wc -l`.to_i
           convertDone(@channel,pages,filePath)
         end
         @course = Courselist.new
         @Author = session[:user].username
         render :action => 'newCourse'
  end
  def showUserTeachingCourse
    
  end
  def show
    #if @course.available?
       @channel = "/messages/new/#{params[:id]}"
       @messages = Message.find_all_by_channel(@channel)
       @course = Courselist.find(params[:id])#slideSource = "/assets/math-symbols.jpg"
       render :layout => 'slide'
    #else
    #   redirect_to "course/#{params[:id]}/wait"
    #end
  end
  def wait
    render :layout => 'home'
  end
  def newCourse
      @course = Courselist.new
      @Author = session[:user].username
      @course.author = @Author
  end
  def createCourse
      pages = params[:totalPage].to_i
      name = params[:fileName]
      @course = Courselist.new(params[:courselist])
      @course.slideorder[:totalPage] = pages
      pages.times do |i|
        @course.slideorder[i] = "#{name}-#{i}.jpg"
      end
	if @course.save
		render :action => :show
	else
		render :action => :newCourse
	end
  end
  def editCourse
      @author = session[:user].username
      @course = Courselist.find_by_author(@author)
  end
  def updateCourse
      @author = session[:user].username
      @course = Courselist.find_by_author(@author)  #showUserTeachingCourse
      if @course.update_attributes(params[:courselist])
        redirect_to "/user/slide"
      else
	    render :action=> :editCourse
      end
  end
  def destroyCourse
      
       @course.destroy 
       redirect_to "/home"
  end
  def destroy
         #delete = Coursecontent.cleanup
	 #render :action=>:index
         #flash[:notice] = "File has been deleted successfully"
  end
  def recordpage
      @course=Coursecontent.all
  end
  def record
      name = params[:filename]
      format = params[:format]
      filename = name+"."+format
      post = Coursecontent.saverecord(request.body,filename)
      render :action=>:recordpage
  end
  
  def playrecord 
    name = params[:filename]
    format = params[:format]
    filename = name+"."+format    
    redirect_to 'http://localhost:3000/data/#{filename}'
  end
  def download	  
    redirect_to 'http://localhost:3000/data/hw4.zip'
  end
  protected
  def find_course
       @author = session[:user].username
       @courses = Courselist.find_all_by_author(@author)
  end
  def find_slide
      @course = Coursecontent.find(params[:id])
  end
  def convertDone(channel,pages,name)
    message = {:channel => channel, :data => {:pages => pages, :name => name}, :ext =>{:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri,:message => message.to_json)
  end

  
end
