class UserSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :phone
end