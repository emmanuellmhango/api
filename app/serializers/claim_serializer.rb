class ClaimSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :location, :comment, :forwarded, :category_id, :user_id, :client_id, :img_one, :img_one_url, :img_two, :img_two_url
end
