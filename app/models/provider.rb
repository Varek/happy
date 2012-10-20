class Provider < ActiveRecord::Base
  attr_accessible :name, :url

  has_many :photos
  has_many :videos
  has_many :texts
end
