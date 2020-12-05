class Trip < ApplicationRecord
  belongs_to :destination

  has_many :days, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :book_trips, dependent: :destroy
  has_many :schedules,  through: :days, source: :schedules

  enum currency: { RS: 0, EGP: 1}

  has_many_attached :images
  def images_url
    self.images.attachment.nil? ? '' : self.images.attachment.service_url
  end
end
