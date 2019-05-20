class User < ApplicationRecord
  has_many :messages
  # Show Users that Like you
  # (matchee) mike.liked_by_users => ["Erica", "Chanel", "Deborah"] (matcher)
  has_many :matched_by_users, foreign_key: :matchee_id, class_name: 'Match'
  has_many :liked_by_users, through: :matched_by_users, source: :matcher
  # Show Users that you Like
  # (matcher) mike.likes => ["Erica", "Trish"] (matchee)
  has_many :matching_users, foreign_key: :matcher_id, class_name: 'Match'
  has_many :likes, through: :matching_users, source: :matchee

  # Show Users that sent you messages
  has_many :sender_conversations, foreign_key: :user_b_id, class_name: 'Conversation'
  has_many :senders, through: :sender_conversations, source: :user_a
  # Show Users that recieved your messages / Show Users you sent messages to
  has_many :recipient_conversations, foreign_key: :user_a_id, class_name: 'Conversation'
  has_many :recipients, through: :recipient_conversations, source: :user_b

  belongs_to :character, optional: true
  # Presence Validation
  validates :email, :gender, :preference, :username, presence: true
  # Uniqueness Validation
  validates :username, :email, uniqueness: true
  validates :username, :email, uniqueness: {case_sensitive: false}
  # Age Validation
  # validates :age, numericality: {greater_than: 17}

  has_secure_password

end
