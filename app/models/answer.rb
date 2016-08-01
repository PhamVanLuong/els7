class Answer < ActiveRecord::Base
  belongs_to :word
  
  validates :mean, presence: true
end
