class CourseController < ApplicationController
  #ssl_required :record,:recordpage,:crossdomain
      	#CRUD Function
   #before_filter :find_course, :only=> [:show,:edit,:update,:destroy]
 # before_filter :url_options, :only => [:record]
  def url_options
    super
    @_url_options.dup.tap do |options|
      options[:protocol] = Rails.env.production? ? "https://" : "http://"
      options.freeze
    end
  end
  
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
  def recordpage
      @course=Coursecontent.all
  end
  def record
      post = Coursecontent.save(params[:course])
      render :action=>:recordpage
  end
  def crossdomain
	  redirect_to "http://localhost:3000/crossdomain.xml"
  end
  protected
  def find_course
      @course = Coursecontent.find(params[:id])
  end
end
