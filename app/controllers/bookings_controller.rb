class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @number_of_passengers = params[:number_of_passengers]
  end
end
