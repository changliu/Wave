class CircleUser < ActiveRecord::Base
  attr_accessible :user, :circle
  belongs_to :circle
  belongs_to :user
end
