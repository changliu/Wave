class Circle < ActiveRecord::Base
  attr_accessible :name, :num_users
  has_and_belongs_to_many :users
end
