class Lesson < ActiveRecord::Base
  has_many :activities
  has_many :results
  
  belongs_to :user
  belongs_to :caterory
end
