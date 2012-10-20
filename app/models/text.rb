class Text < ActiveRecord::Base
  attr_accessible :title, :description, :provider_id, :url

  has_many :moments_things, :as => :thing
  has_many :moments, :through => :moments_things
  belongs_to :provider
end
