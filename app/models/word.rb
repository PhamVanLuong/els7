class Word < ActiveRecord::Base
  has_many :results
  has_many :answers
  
  belongs_to :caterory
  
  validates :learning_word, presence: true, length: {maximum: Settings.maximum_word}
  validates :meaning, presence: true, length: {maximum: Settings.maximum_meaning}
end
