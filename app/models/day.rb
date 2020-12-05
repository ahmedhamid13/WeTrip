class Day < ApplicationRecord
  belongs_to :trip
  
  has_many :schedules, dependent: :destroy
end
