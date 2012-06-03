class UserController < ApplicationController
  before_filter :find_user, :only=> [:show,:edit,:update,:destroy]
<<<<<<< HEAD
  def login
     if user = Userlist.authenticate(params[:user])
        session[:user] = user # Remember the user
        redirect_to session[:return_to] || '/'
     else
        #flash[:error] = 'Invalid login.' 
        redirect_to '/', :username => params[:user][:username], :flash => {:error => 'Failed'}
        #render :action => 'new'
     end
  end
  def logout
     reset_session
     redirect_to '/'
  end
=======
>>>>>>> d87593cec2050b49cb9b3e466146d0d495943808
  def index
      @users = Userlist.all
  end
  def new
      @user = Userlist.new
      render :layout => 'home'
  end
  def create
      @user = Userlist.new(params[:userlist])
      if @user.username == "new"          
          flash[:alert] = "This name has been taken."
          render :layout => 'home'
      elsif @user.save
	      redirect_to users_url #action => :index
      else
         render :layout => 'home'
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
