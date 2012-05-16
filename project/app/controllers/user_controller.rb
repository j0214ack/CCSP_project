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
      if @user.save
	      redirect_to users_url #action => :index
      else
	      render :action => :new
      end
      #flash[:notice] = "User was sucessfully created"
  end
  def show
      @page_title = @user.username	  
  end
  def edit
  
  end
  def update
    if @user.update_attributes(params[:userlist])
        redirect_to user_url(@user)  #:action => :show, :id=> @user
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
      @user = Userlist.find(params[:id])
  end
end
