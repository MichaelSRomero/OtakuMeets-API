class PersonalitySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :characters
  has_many :traits
end
