class PassengerMailer < ApplicationMailer
  def booking_confirmation(passenger)
    @passenger = passenger
    @flight = @passenger.flight
    mail(to: @passenger.email, subject: 'Flight Booking Confirmation')
  end
end
