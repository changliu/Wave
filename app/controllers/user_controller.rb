class UserController < ApplicationController
	def login
		@access_token = params[:token]
		@user = User.login(access_token)
		if !@user.blank?
			session[:user] = @user
			ret = "OK"
		else
			ret = "NOK"
		end
		ret
	end
end