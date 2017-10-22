class ReservationsController < ApplicationController
	def new
		@restaurant = Restaurant.find(params[:restaurant_id]) #capital letter = class method
		@reservation = Reservation.new
end

	def create
		@reservation = Reservation.new(reservation_params)
		restaurant = Restaurant.find(params[:restaurant_id])
		@reservation.restaurant = restaurant

		respond_to do | format |
			if @reservation.save
				format.html { redirect_to restaurant, notice: 'Your reservation was successful. We look forward to provding you with an excellent dining experience'}
		else
			format.html {render :new}
		end
	end 
end 

private
def reservation_params
		params.require(:reservation).permit(:GuestName, :TimeDate, :guests)
	end
end 