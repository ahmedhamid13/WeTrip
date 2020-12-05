json.extract! trip, :id, :en_name, :en_description, :en_leaving_place, :ar_name, :ar_description, :ar_leaving_place, :leaving_time, :returning_time, :child_price, :adult_price, :currency, :available_places, :destination_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
