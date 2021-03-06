class CourseController < ApplicationController
  #CRUD Function
  before_filter :find_course, :only=> [:showUserTeachingCourse,:editCourse,:updateCourse,:destroyCourse]
  #before_filter :find_course, :only=> [:show]#,:edit,:update,:destroy]
  def index
      @course=Coursecontent.all	  
  end

  def upload  
      #raise params[:course].	  
         fileName = Coursecontent.save(params[:course])
         name = /(.*)(\.ppt|\.pptx)/.match(fileName)[1]
         flash[:notice] = "File has been uploaded successfully"
         command1 = "unoconv #{Rails.root}/public/data/#{fileName}"
         command2 = "convert -quality 100 -density 300x300 #{Rails.root}/public/data/#{name}.pdf #{Rails.root}/public/data/#{sessioni[:user].username}/#{name}/#{name}.jpg"
         fork do 
           system "mkdir #{Rails.root}/public/data/#{session[:user].username}"
           system "mkdir #{Rails.root}/public/data/#{session[:user].username}/#{name}"
           system command1
           system command2
         end
         redirect_to '/home/newCourse'
  end
  def showUserTeachingCourse
  end
  def show
    #if @course.available?
       @channel = "/messages/new/#{params[:id]}"
       @messages = Message.find_all_by_channel(@channel)
       @slideSource = "/assets/math-symbols.jpg"
       render :layout => 'slide'
    #else
    #   redirect_to "course/#{params[:id]}/wait"
    #end
  end
  def wait
    render :layout => 'home'
  end
  def showUserDescribedCourse
	  

  end
  def newCourse
      @course = Courselist.new
      @Author = session[:user].username
      @course.author = @Author
  end
  def createCourse
      @course = Courselist.new(params[:courselist])
	if @course.save
		redirect_to '/home/slide'
	else
		render :action => :newCourse
	end
  end
  def editCourse
      
  end
  def updateCourse
      
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
       @courses = Courselist.find_by_author(@author)
  end
  
  def find_slide
      @course = Coursecontent.find(params[:id])
  end
end
