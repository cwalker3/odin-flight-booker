class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: 'departure_airport_id', class_name: 'Flight'
  has_many :arriving_flights, foreign_key: 'arrival_airport_id', class_name: 'Flight'
  has_many :passengers, through: :bookings

  def self.options_for_select
    all.map { |a| [a.name, a.id] }
  end
end
