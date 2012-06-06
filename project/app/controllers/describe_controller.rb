class DescribeController < ApplicationController
  before_filter :find_described, :only => [:showUserDescribedCourse]
  def showUserDescribedCourse
  end
  def newCourse
      @course = Courselist.new
      @Author = session[:user].username
      @course.author = @Author
  end
  def create
      @course = Courselist.new(params[:courselist])
	if @course.save
		redirect_to '/home/slide'
	else
		render :action => :newCourse
	end
  end
  def edit
      @author = session[:user].username
      @course = Courselist.find_by_author(@author)
  end
  def update
      @author = session[:user].username
      @course = Courselist.find_by_author(@author)  showUserTeachingCourse
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
  protected
  def find_described
       @username = session[:user].username
       @userid = session[:user].id
       @describedCourses = Describerlist.find_by_userid(@userid)
  end
end
