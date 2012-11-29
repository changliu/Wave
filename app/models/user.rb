class User < ActiveRecord::Base
  attr_accessible :access_token, :name
  has_many :circle_users
  has_many :circles, :through => :circle_users, :dependent => :destroy

  def self.login(token, name)
  	return nil if token.blank?
    return nil if name.blank?
  	user = User.where("name = ?", name).first
		if user.blank? # user never entered
			user = User.create!(:access_token => token, :name => name)
    else # user already entered into database by another friend
      user.access_token = token
      user.save!
		end
		return user
  end

  def get_circles
    mycircles = self.circles.select do |c|
      c.creator.id.equal? self.id
    end
    return mycircles
  end
end