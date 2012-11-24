class CircleUser < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :circle
  belongs_to :user
end
