class ClaimSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :location, :comment, :forwarded, :category_id, :user_id, :client_id, :created_at, :images, :image_urls

  belongs_to :user, serializer: UserSerializer
  belongs_to :client, serializer: ClientSerializer
  belongs_to :category, serializer: CategorySerializer

  def image_urls
    if object.images.attached?
      object.images.map { |image| url_for(image) }
    else
      []
    end
  end
end
