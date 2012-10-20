class Photo < ActiveRecord::Base
  attr_accessible :title, :thumb_url, :photo_url, :description, :provider_id, :url

  has_many :moments_things, :as => :thing
  has_many :moments, :through => :moments_things
  belongs_to :provider
end
