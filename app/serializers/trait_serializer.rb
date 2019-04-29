class TraitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :symbol
  has_many :answers
end
