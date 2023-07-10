class Category < ApplicationRecord
  has_many :claims
  has_one :user_managements
end
