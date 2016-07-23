class User < ActiveRecord::Base
  before_save{email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :lessons
  has_many :results, dependent: :destroy
  has_many :activities
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", 
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.minimum_password}

  has_secure_password
end
