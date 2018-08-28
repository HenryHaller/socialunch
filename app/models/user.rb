class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  acts_as_taggable_on :languages

  mount_uploader :photo, PhotoUploader

  validates :first_name, :last_name, :bio, presence: true
  has_many :lunch_requests, dependent: :destroy
  has_many :messages, dependent: :destroy

  def other_active_request
    # LunchRequest.where(user: self, active: true).count == 0
    LunchRequest.where(user: self, active: true).first
    # errors.add(:base, 'get out of here, you already have a request') if active_lunch
    # LunchRequest.where(user: user, active)
  end

  # has_many :restaurants, through: :lunch_dates
end
