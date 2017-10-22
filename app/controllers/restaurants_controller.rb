class RestaurantsController < ApplicationController
	
	before_action :authenticate_owner!, except: [:index]
	before_action :set_restaurant, only: [:show, :edit, :destroy, :update]
	before_action :check_correct_owner, only: [:edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(name: params[:name], cuisine: params[:cuisine], telephone: params[:telephone], address: params[:address], price: params[:price], rating: params[:rating])
		@restaurant.owner = current_owner

		respond_to do |format|
			if @restaurant.save
				format.html { redirect_to @restaurant, notice: "Reservation was Successfully created."}
				format.json { render :show, status: :creation, location: @restaurant}
				else
					format.html {render :new}
					format.json { render json: @restaurant.errors, status: :unprocessable_entity}
				end
			end
		end

	def edit

	end 

	def update
		respond_to do |format|

	if @restaurant.update(name: params[:name], cuisine: params[:cuisine], telephone: params[:telephone], address: params[:address], price: params[:price], rating: params[:rating])

		  redirect_to restaurants_path
		  format.html { redirect_to @restaurant, notice: "Reservation was Successfully Updated."}
		  format.json { render :show, status: :creation, location: @restaurant}
	      else
		  format.html {render :edit}
		  format.json { render json: @restaurant.errors, status: :unprocessable_entity}
	    end
    end
end

	def destroy

		@restaurant.destroy
		respond_to do |format|
		format.html { redirect_to restaurants_url, notice: 'Restaurant was sucessfully Destroyed'}
		format.json { head :no_content}
		redirect_to restaurants_path
	end 
end 

	def show 
		@reservations = Reservation.where(restaurant: @restaurant)
	end

	

	private 	

	def set_restaurant
		@restaurant = Restaurant.find(params[:id])
	end

	def restaurants_params
		params.require(:restaurant).permit(:name, :cuisine, :telephone, :address, :price, :rating)
	end 

	def check_correct_owner
		unless current_owner && @restaurant.owner == current_owner
			redirect_to restaurants_url, notice: 'You can\'t edit that restaurant'	
		end
	end 

end

 

