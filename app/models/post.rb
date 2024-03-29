class Post < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :desc)}
  has_one_attached :image
end
