class User < ActiveRecord::Base
  attr_accessible :access_token, :name
  has_many :circle_users
  has_many :circles, :through => :circle_users, :dependent => :destroy

  @@num = 0
  def self.login(token)
  	return nil if token.blank?
  	user = User.where("access_token = ?", token).first
		if user.blank?
      username = "User" + @@num.to_s
			user = User.create!(:access_token => token, :name => username)
      @@num += 1
		end
		return user
  end
end