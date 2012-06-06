class SlideController < ApplicationController
  def new
    @slide = Coursecontent.new
  end
  def create
    @slide = Coursecontent.new(params[:coursecontent])
    if @slide.save
      
    else
    end
  end

end
