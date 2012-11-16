class User < ActiveRecord::Base
  attr_accessible :access_token, :name
  has_and_belongs_to_many :circles

  def self.login(token)
  	return nil if token.blank?
  	user = User.where("access_token = ?", token).first
		if user.blank?
			user = User.create!(:access_token => token)
		end
		return user
  end
end