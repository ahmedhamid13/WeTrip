class Trip < ApplicationRecord
  belongs_to :destination

  has_many :days, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :book_trips, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :schedules,  through: :days, source: :schedules

  enum currency: { RS: 0, EGP: 1}
  default_scope { where(is_available: true).order(created_at: :desc) }
  scope :available_trips, -> { where(is_available: true).order(created_at: :desc) }

  has_many_attached :images
  def images_url
    self.images.attachment.nil? ? '' : self.images.attachment.service_url
  end

  def check_trips
    Trip.all.each do |trip|
      if DateTime.now > trip.leaving_time
        trip.update(is_available: false)
        trip.book_trips.update_all(history: true)
      else
        trip.update(is_available: false)
      end
    end
  end
end
