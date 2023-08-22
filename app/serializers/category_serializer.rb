class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :user_management_id, :description, :created_at, :iconUrl
end
