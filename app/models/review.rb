class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  default_scope { order(created_at: :desc)}
end
