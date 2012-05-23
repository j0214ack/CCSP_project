class HomeController < ApplicationController
  def index
    render :layout => 'home'
  end
  def slide
    render :layout => 'slide'
  end
end
