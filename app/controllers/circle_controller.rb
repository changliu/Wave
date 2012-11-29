class CircleController < ApplicationController
	# all of these functions are accessed by AJAX requests
	def create
		user = User.find(session[:user_id])
		name = params[:name]
		c = Circle.create! :name => name, :num_users => 0, :creator => user
		CircleUser.create! :user => user, :circle => c
		render :text => "OK"
	end

	def modify
		user = User.find(session[:user_id])
		id = params[:id].to_i
		@token = params[:token]
		@c = user.circles.find(id)
	end

	def delete
		#user = User.find(session[:user_id])
		circle_id = params[:id]
		c = Circle.find(circle_id)
		c.circle_users.each do |cu|
			cu.destroy
		end
		Circle.find(circle_id).destroy
		#user.circles.where(:circle_id => circle_id)[0].destroy
		#user.save!
		render :text => "OK"
	end

	def rename
		user = User.find(session[:user_id])
		circle_id = params[:id]
		new_name = params[:new_name]
		c = user.circles.find(circle_id)
		c.name = new_name
		c.save!
		render :text => "OK"
	end

	def add_user
		user = User.find(session[:user_id])
		circle_id = params[:circle_id]
		user_id = params[:user_id]
		c = user.circles.find(circle_id)
		new_user = User.find(user_id)
		c.users << new_user
		c.num_users += 1
		c.save!
		render :text => "OK"
	end

	def user_exists_in_circle
		circle_id = params[:circle_id].to_i
		user_id = params[:user_id].to_i
		entries = CircleUser.where(:user_id => user_id, :circle_id => circle_id).count
		if entries > 0
			render :text => "OK"
		else
			render :text => "NOK"
		end
	end

	def remove_user
		user = User.find(session[:user_id])
		circle_id = params[:circle_id].to_i
		user_id = params[:user_id].to_i
		render :text => "NOK" if user_id == user.id
		c = user.circles.find(circle_id)
		render :text => "NOK" if c.num_users == 0
		c.circle_users.where(:user_id => user_id)[0].destroy
		c.num_users -= 1
		c.save!
		render :text => "OK"
	end

	def get_all_users
		user = User.find(session[:user_id])
		all_users = []
		Circle.find_each do |c|
			all_users << c.users
		end
		all_users.uniq!
		all_users = all_users.delete_if{|u| u.object_id == user.object_id}
		render :json => all_users
	end
end