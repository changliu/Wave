class UserController < ApplicationController
	def login
		access_token = params[:token]
		full_name = params[:full_name]
		if access_token.blank? or full_name.blank?
			render :text => "NOK"
			return
		end

		user = User.login(access_token, full_name)
		if !user.blank?
			session[:user_id] = user.id
			render :text => "OK"
		else
			render :text => "NOK"
		end
	end

	def create
		full_name = params[:name]
		u = User.create! :name => full_name
		result = u.save
		if result
			render :text => u.id
		else
			render :text => "NOK"
		end
	end

	def exists
		full_name = params[:name]
		user_num = User.where(:name => full_name).count
		user = User.where(:name => full_name)[0]
		if user_num > 0
			render :text => user.id
		else
			render :text => "NOK"
		end
	end
end