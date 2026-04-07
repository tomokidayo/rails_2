class User < ApplicationRecord
  PASSWORD_MIN_LENGTH = 6

  has_secure_password
  has_many :rooms
  has_many :reservations
  has_one_attached :icon

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password,
            presence: true,
            length: { minimum: PASSWORD_MIN_LENGTH },
            on: :create
end
