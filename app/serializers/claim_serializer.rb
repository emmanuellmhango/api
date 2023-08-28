class ClaimSerializer
  include JSONAPI::Serializer
  attributes :comment, :location, :forwarded, :user_id, :category_id, :geocode, :images, :created_at
end
