class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category

  has_many_attached :images
end
