class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save

      @booking.passengers.each { |passenger| PassengerMailer.booking_confirmation(passenger).deliver_later }

      redirect_to @booking, notice: 'Successfully created booking.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
