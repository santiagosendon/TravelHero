class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :bio, presence: true
  validates :password, presence: true, on: :create

  has_many :trips
  has_many :cities, through: :trips
end
