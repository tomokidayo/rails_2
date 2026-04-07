class User < ApplicationRecord
  has_secure_password
  has_many :rooms
  has_many :reservations
  has_one_attached :icon

  # バリデーションの追加
  validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  # validates :email, uniqueness: true, unless: -> { email_changed? }
  # validates :email, uniqueness: true, if: -> { email_changed? }
  validates :email, presence: true, on: :create
  validates :email, uniqueness: true, on: :create

  # validates :password, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
