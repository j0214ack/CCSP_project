class CourseController < ApplicationController
  #CRUD Function
   #before_filter :find_course, :only=> [:show,:edit,:update,:destroy]
  def index
      @course=Coursecontent.all	  
  end
  def upload  
      #raise params[:course].	  
<<<<<<< HEAD
         name = Coursecontent.save(params[:course])
	 command
	 exec("uconv") if fork.nil?
	 redirect_to '/home/slide'

=======
         fileName = Coursecontent.save(params[:course])
         name = /(.*)(\.ppt|\.pptx)/.match(fileName)[1]
         flash[:notice] = "File has been uploaded successfully"
         command1 = "unoconv #{Rails.root}/public/data/" + fileName
         command2 = "convert -quality 100 -density 300x300 #{Rails.root}/public/data/" + name + ".pdf #{Rails.root}/public/data/" + name +".jpg"
         fork do 
           system command1
           system command2
         end
         redirect_to '/home/slide'
>>>>>>> 71e94ec42b27b1117ef09d361c33349019f232a1
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
<<<<<<< HEAD
  def download
     send_file 
  end
=======
>>>>>>> 71e94ec42b27b1117ef09d361c33349019f232a1
  protected
  def find_course
      @course = Coursecontent.find(params[:id])
  end
end
