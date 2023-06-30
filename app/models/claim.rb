class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category
end
