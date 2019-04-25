class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :gender, :preference, :username, :age
  has_one :character
  has_many :liked_by_users
  has_many :likes
end
