class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category

  has_one_attached :img_one
  has_one_attached :img_two
end
