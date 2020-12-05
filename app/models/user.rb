class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :first_name, :last_name, :gender # required
  enum gender: { male: 0, female: 1}
  enum nationality: { Egyptian: 0, Saudi_Arabia: 1, Other: 2}

  has_many :book_trips
  has_many :reviews
  has_many :posts

  has_one_attached :avatar
  def avatar_url
    self.avatar.attachment.nil? ? '' : self.avatar.attachment.service_url
  end
end
