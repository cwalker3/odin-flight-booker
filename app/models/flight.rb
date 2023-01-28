class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def self.options_for_date
    order(:departure_date).map { |flight| [flight.departure_date_formatted, flight.departure_date] }.uniq
  end

  def departure_date_formatted
    departure_date.strftime('%A, %B %d, %Y')
  end

  def departure_time_formatted
    departure_time.strftime('%H:%M %Z')
  end
end
