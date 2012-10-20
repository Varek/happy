class Video < ActiveRecord::Base
  attr_accessible :title, :embed_code, :thumb_url, :description, :provider_id, :url

  has_many :moments_things, :as => :thing
  has_many :moments, :through => :moments_things
  belongs_to :provider
end
