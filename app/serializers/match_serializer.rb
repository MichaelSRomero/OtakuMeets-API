class MatchSerializer < ActiveModel::Serializer
  attributes :id, :matcher, :matchee
  belongs_to :matchee
  belongs_to :matcher

end
