class Passenger < ApplicationRecord
  belongs_to :flight, through: :bookings
end
