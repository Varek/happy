class Email < ActiveRecord::Base
  attr_accessible :subject, :content

  has_many :moments_things, :as => :thing
  has_many :moments, :through => :moments_things
end
