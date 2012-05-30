class UserController < ApplicationController
  before_filter :find_user, :only=> [:show,:edit,:update,:destroy]
  def index
      @users = Userlist.all
  end
  def new
      @user = Userlist.new
  end
  def create
      @user = Userlist.new(params[:userlist])
      if @user.username == "new"          
          render :action=>:new
          flash[:alert] = "This name has been taken."
      elsif @user.save
	      redirect_to users_url #action => :index
      else
	      render :action => :new
      end
      
  end
  def show
   
  end
  def edit
  
  end
  def update
    if @user.update_attributes(params[:userlist])
        redirect_to "/user/"+@user.username  #:action => :show, :id=> @user
    else
	    render :action=> :edit
    end
    #flash[:notice] = "User was successfully updated"
  end
  def destroy
      @user.destroy
      redirect_to users_url #action => :index      
  end
  protected 
  def find_user      
      #raise params[:username].to_s    
          @user = Userlist.find_by_username(params[:username])
  end
end
