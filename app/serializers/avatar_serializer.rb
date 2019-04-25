class AvatarSerializer < ActiveModel::Serializer
  attributes :id, :image_url
  belongs_to :character
end
