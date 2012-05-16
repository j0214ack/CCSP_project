class CourseController < ApplicationController
  #CRUD Function
  def index
	  
  end
  def upload
      post = Coursecontent.save(params[:course])
      flash[:notice] = "File has been uploaded successfully"
  end
end
