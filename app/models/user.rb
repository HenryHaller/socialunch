class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  acts_as_taggable_on :languages

  validates :first_name, :last_name, :birthday, :bio, presence: true
  has_many :lunch_requests
  # has_many :restaurants, through: :lunch_dates
end
