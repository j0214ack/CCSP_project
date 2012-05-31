class HomeController < ApplicationController
  def index
    render :layout => 'home'
  end
  def slide
    @messages = Message.all
    render :layout => 'slide'
  end
end
