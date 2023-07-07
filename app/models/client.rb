class Client < ApplicationRecord
  has_many :claims
  has_one_attached :icon

  def icon_url   
    Rails.application.routes.url_helpers.url_for(icon) if icon.attached?
  end
end
