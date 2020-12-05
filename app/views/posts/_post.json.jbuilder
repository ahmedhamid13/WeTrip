json.extract! post, :id, :en_title, :en_body, :ar_title, :ar_body, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
