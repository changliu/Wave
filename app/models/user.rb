class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :circles

  def login(access_token)
  	@user = User.where("access_token=?", access_token)
		if @user.blank?
			@user = User.create!(:access_token => access_token)
		end
		return @user
  end
end