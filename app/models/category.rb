class Category < ApplicationRecord
  has_many :claims
  belongs_to :user_management
end
