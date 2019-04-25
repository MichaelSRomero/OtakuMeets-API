class MatchSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :matchee
  belongs_to :matcher
end
