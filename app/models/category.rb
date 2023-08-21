class Category < ApplicationRecord
  belongs_to :user_management

  has_many_attached :images
end
