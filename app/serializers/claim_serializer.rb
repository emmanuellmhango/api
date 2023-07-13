class ClaimSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :location, :comment, :forwarded, :category, :user_id, :created_at, :images, :image_urls

  belongs_to :user, serializer: UserSerializer

  def image_urls
    if object.images.attached?
      object.images.map { |image| url_for(image) }
    else
      []
    end
  end
end
