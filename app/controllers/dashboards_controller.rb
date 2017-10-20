class DashboardsController < ApplicationController

	def dashboard
		@restaurant = Restaurant.where(owner: current_owner)
	end
end 