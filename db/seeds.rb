Flight.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(:flights)
Airport.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(:airports)

Airport.create([{ code: 'ATL', name: 'Atlanta International Airport' },
                { code: 'LAX', name: 'Los Angeles International Airport' },
                { code: 'ORD', name: 'Chicago International Airport' },
                { code: 'DFW', name: 'Dallas International Airport' },
                { code: 'DEN', name: 'Denver International Airport' },
                { code: 'JFK', name: 'John F. Kennedy International Airport' },
                { code: 'SFO', name: 'San Francisco International Airport' },
                { code: 'SEA', name: 'Seattle International Airport' }])

time = Time.new(2023, 1, 1, 0, 0, 0, '-08:00')

100.times do
  Airport.ids.each do |departure_airport_id|
    Airport.ids.each do |arrival_airport_id|
      next if departure_airport_id == arrival_airport_id

      Flight.create(arrival_airport_id:,
                    departure_airport_id:,
                    departure_date: time + rand(0..365).days,
                    departure_time: time + (rand(96) * 15).minutes,
                    duration: rand(60..600))
    end
  end
end
