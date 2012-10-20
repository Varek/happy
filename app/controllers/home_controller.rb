class HomeController < ApplicationController
  def index
    #@photo = Photo.joins(:moments_things => :moment).where("user_id = #{current_user.id}").last
    @moment = Moment.joins(:photo).where("user_id = #{current_user.id}").last if logged_in?
  end

  def welcome
    @moment = Moment.new
  end

end
