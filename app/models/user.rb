class User < ApplicationRecord
  has_secure_password
  # app/models/user.rb

has_many :rooms
end
