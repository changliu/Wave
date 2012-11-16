class UserController < ApplicationController
	def login
		@access_token = params[:token]
		if @access_token.blank?
			render :text => "NOK"
		end
		@user = User.login(access_token)
		if !@user.blank?
			session[:user] = @user
			render :text => "OK"
		else
			render :text => "NOK"
		end
	end
end