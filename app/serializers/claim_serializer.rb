class ClaimSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :comment, :location, :forwarded, :user_id, :client_id, :category_id, :img_one, :img_two, :img_one_url, :img_two_url
end
