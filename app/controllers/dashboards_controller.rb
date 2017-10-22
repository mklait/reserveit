class DashboardsController < ApplicationController

	def dashboard
		@restaurants = Restaurant.where(owner: current_owner)
	end
end 