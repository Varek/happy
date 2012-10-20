# encoding: UTF-8
class HomeController < ApplicationController
  def index
    #@photo = Photo.joins(:moments_things => :moment).where("user_id = #{current_user.id}").last
    @moment = Moment.joins(:photo).where("user_id = #{current_user.id}").last if logged_in?
  end

  def welcome
    @moment = Moment.new
  end

  def challenges
    challenges = ['Call someone you have not talked to in a year', 'Play the first record you ever bough and share it with someone who will remember', 'Think about what you wanted to be when you were younger', 'Go and ask your neighbor if they have some tea','google “most amazing landscapes in the world”!']
    @challenge = challenges[SecureRandom.random_number(6)]
  end

end
