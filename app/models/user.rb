class User < ApplicationRecord
  has_many :claims
  has_many :categories
  has_many :clients
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
