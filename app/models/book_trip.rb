class BookTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :user

  validates :adults, :children, numericality: { greater_than_or_equal_to: 0 }
end
