class PersonalitySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :characters
end
