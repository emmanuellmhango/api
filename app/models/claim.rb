class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category

  has_many_attached :images

  def image_urls
    if images.attached?
      images.map do |image|
        Rails.application.routes.url_helpers.url_for(image, only_path: true)
      end
    end
  end

end
