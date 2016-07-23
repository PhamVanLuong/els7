class Caterory < ApplicationRecord
  has_many :lessons
  has_many :words
end
