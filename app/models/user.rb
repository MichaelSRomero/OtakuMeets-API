class User < ApplicationRecord
  # Show Users that Like you
  # (matchee) mike.liked_by_users => ["Erica", "Chanel", "Deborah"] (matcher)
  has_many :matched_by_users, foreign_key: :matchee_id, class_name: 'Match'
  has_many :liked_by_users, through: :matched_by_users, source: :matcher
  # Show Users that you Like
  # (matcher) mike.likes => ["Erica", "Trish"] (matchee)
  has_many :matching_users, foreign_key: :matcher_id, class_name: 'Match'
  has_many :likes, through: :matching_users, source: :matchee

  belongs_to :character, optional: true
  # Presence Validation
  validates :email, :gender, :preference, :username, presence: true
  # Uniqueness Validation
  validates :username, :email, uniqueness: true
  # Age Validation
  validates :age, numericality: {greater_than: 17}

  has_secure_password
end
