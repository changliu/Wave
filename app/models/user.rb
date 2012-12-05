class User < ActiveRecord::Base
  attr_accessible :access_token, :name
  has_many :circle_users
  has_many :circles, :through => :circle_users

  def self.login(token)
  	return nil if token.blank?
  	user = User.where("access_token = ?", token).first
		if user.blank?
			user = User.create!(:access_token => token)
		end
		return user
  end
end