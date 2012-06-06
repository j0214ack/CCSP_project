class CourseController < ApplicationController
  #CRUD Function
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
         redirect_to '/home/slide'
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
  def edit
  end
  def update
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
      post = Coursecontent.save(params[:course])
      render :action=>:recordpage
  end
  def download
     send_file 
  end
  protected
  def find_course
      @course = Coursecontent.find(params[:id])
  end
end
