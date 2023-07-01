class User < ApplicationRecord
  has_many :claims
  has_many :categories
  has_many :clients
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :phone, presence: true
  validates :dob, presence: true
end
