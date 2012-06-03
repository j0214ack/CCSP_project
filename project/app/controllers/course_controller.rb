class CourseController < ApplicationController
  #CRUD Function
   #before_filter :find_course, :only=> [:show,:edit,:update,:destroy]
  def index
      @course=Coursecontent.all	  
  end
  def upload  
      #raise params[:course].	  
         name = Coursecontent.save(params[:course])
	 command
	 exec("uconv") if fork.nil?
	 redirect_to '/home/slide'

  end
  def show
      	  
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
