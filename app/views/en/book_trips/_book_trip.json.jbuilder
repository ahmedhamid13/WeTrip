json.extract! book_trip, :id, :adults, :children, :total_price, :is_paid, :trip_id, :user_id, :created_at, :updated_at
json.url book_trip_url(book_trip, format: :json)
