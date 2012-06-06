class HomeController < ApplicationController
  def index
    render :layout => 'home'
  end
  def slide
    @channel = "/messages/new"
    @messages = Message.find_all_by_channel(@channel)
    @slideSource = "/assets/math-symbols.jpg"
    render :layout => 'slide'
  end
end
