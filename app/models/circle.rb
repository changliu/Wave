class Circle < ActiveRecord::Base
  attr_accessible :name, :num_users, :creator

  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :circle_users
  has_many :users, :through => :circle_users

  def get_users(user_id)
		user = User.find(user_id)
		myusers = self.users.select do |u|
      !(u.id.equal? user.id)
    end
		return myusers
	end
end