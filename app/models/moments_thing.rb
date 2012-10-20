class MomentsThing < ActiveRecord::Base
  attr_accessible :thing, :moment

  belongs_to :moment
  belongs_to :thing, :polymorphic => true
end
