class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :category

  has_one_attached :img_one
  # has_one_attached :img_two

  def img_one_url   
    Rails.application.routes.url_helpers.url_for(img_one) if img_one.attached?
  end  
  
  # def img_two_url   
  #   Rails.application.routes.url_helpers.url_for(img_two) if img_two.attached?
  # end
end
