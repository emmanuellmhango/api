class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :user_management_id, :created_at, :iconUrl
end
