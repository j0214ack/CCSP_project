class CourseController < ApplicationController
  #CRUD Function
   #before_filter :find_course, :only=> [:show,:edit,:update,:destroy]
  def index
      @course=Coursecontent.all	  
  end
  def upload  
      #raise params[:course].	  
         post = Coursecontent.save(params[:course])
  	 render :action=>:index
         flash[:notice] = "File has been uploaded successfully"
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
  protected
  def find_course
      @course = Coursecontent.find(params[:id])
  end
end