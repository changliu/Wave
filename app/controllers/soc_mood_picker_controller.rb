class SocMoodPickerController < ApplicationController
	def index
		@access_token = params[:access_token]
		#@user = User.login(access_token)
		#session[:user] = @user if !@user.blank?
		session[:user] = @access_token
	end
end