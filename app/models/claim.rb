class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many_attached :images

  def image_urls
    images.map { |image| Rails.application.routes.url_helpers.url_for(image) } if images.attached?
  end
end

