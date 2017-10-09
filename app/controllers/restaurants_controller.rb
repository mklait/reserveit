class RestaurantsController < ApplicationController
	
before_action :find_restaurant, only: [:show, :edit, :destroy, :update]
	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurants = Restaurant.new(name: params[:name], cuisine: params[:cuisine], telephone: params[:telephone], address: params[:address], price: params[:price], rating: params[:rating])
		@restaurants.save
		redirect_to restaurants_path

	end

	def edit
		
		redirect_to restaurants_path

	end 

	def update
		@restaurant.update(name: params[:name], cuisine: params[:cuisine], telephone: params[:telephone], address: params[:address], price: params[:price], rating: params[:rating])
		@restaurants.save
		redirect_to restaurants_path

end

def destroy

	@restaurant.destroy
	redirect_to restaurants_path
	end 

	def show 
	end

private 
def find_restaurant
@restaurant = Restaurant.find(params[:id])
end

end 