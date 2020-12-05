class Destination < ApplicationRecord
    has_many :trips, dependent: :destroy
    has_many :book_trips, through: :trips, source: :book_trips
    has_many :reviews, through: :trips, source: :reviews

    has_one_attached :image
    def image_url
        self.image.attachment.nil? ? '' : self.image.attachment.service_url
    end
end
