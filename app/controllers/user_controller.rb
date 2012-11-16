class UserController < ApplicationController
	def login
		@access_token = params[:token]
		if @access_token.blank?
			#render :status => 500
		end
		@user = User.login(access_token)
		if !@user.blank?
			session[:user] = @user
			render :status => 200
		else
			#render :status => 500
		end
	end
end