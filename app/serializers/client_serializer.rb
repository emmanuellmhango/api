class ClientSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :phone, :icon, :icon_url
end
