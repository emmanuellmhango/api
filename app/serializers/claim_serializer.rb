class ClaimSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :location, :comment, :forwarded, :category_id, :user_id, :client_id, :images, :image_urls
  
end
