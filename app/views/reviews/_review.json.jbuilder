json.extract! review, :id, :comment, :user_id, :trip_id, :created_at, :updated_at
json.url review_url(review, format: :json)
