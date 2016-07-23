class Word < ActiveRecord::Base
  has_many :results
  has_many :answers
  
  belongs_to :caterory
end
