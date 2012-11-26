class Circle < ActiveRecord::Base
  attr_accessible :name, :num_users, :creator

  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :circle_users
  has_many :users, :through => :circle_users

  def get_users
  	#session[:user_id] = 2
		user = User.find(2)
		all_users = self.users
		all_users.delete_if{|u| u.id.equal? user.id}
		return all_users
	end
end