class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many_attached :images

  def image_urls
    object.images.attached? ? object.images.map { |image| url_for(image) } : []
  end
end
