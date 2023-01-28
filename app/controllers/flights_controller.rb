class FlightsController < ApplicationController
  def index
    @flight = params[:flight] ? Flight.new(flight_params) : Flight.new
    @airport_options = Airport.options_for_select
    @date_options = Flight.options_for_date

    if params[:flight]
      @flights = Flight.includes(:departure_airport, :arrival_airport).order(:departure_date).where(flight_params)
      @number_of_passengers = params[:flight][:number_of_passengers]
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_date).compact_blank
  end
end
