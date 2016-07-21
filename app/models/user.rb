class User < ApplicationRecord
  before_save{email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :result, dependent: destroy
  has_many :activity

  validates :name,  presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 100},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 20}

  has_secure_password  
end
