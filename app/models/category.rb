class Category < ApplicationRecord
  belongs_to :user_management

  has_one_attached :icon

  def iconUrl   
    Rails.application.routes.url_helpers.url_for(icon) if icon.attached?
  end
end
