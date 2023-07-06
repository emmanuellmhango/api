class ClaimSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :comment, :location, :forwarded, :user_id, :client_id, :category_id, :images, :image_urls
end
