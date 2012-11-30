class SocWaveListController < ApplicationController
	def login
		dest = params[:dest]
		if dest == "groups"
			session[:dest] = "groups"
		else
			session[:dest] = "moods"
		end
	end
end
