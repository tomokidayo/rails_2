class User < ApplicationRecord
  has_secure_password
  # app/models/user.rb
  has_many :rooms
  has_many :reservations

  # バリデーションの追加

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

end
