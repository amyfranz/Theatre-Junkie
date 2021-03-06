class BookingsController < ApplicationController

    def index 
        @bookings = Booking.all
    end 

    def show 
        @booking = Booking.find(params[:id])
    end 

    def new
        byebug
        @booking = Booking.new
        @performances = Performance.all 
        @users = User.all
    end 

    def create 
        @booking = Booking.create(booking_params)
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        flash[:notice] = "Booking deleted."
        redirect_to bookings_path
    end

    private 

    def booking_params
        params.require(:booking).permit(:performance_id, :seating_type, :num_of_tickets)
    end 
end
