class CircleController < ApplicationController
	def new
		user = session[:user]
		name = params[:name]

		circle = Circle.create! :name => name, :num_users => 0, :creator => user
	end
end
