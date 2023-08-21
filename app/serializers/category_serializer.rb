class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :user_management_id, :created_at, :updated_at, :iconUrl
end
