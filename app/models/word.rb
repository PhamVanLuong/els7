class Word < ApplicationRecord
  belongs_to :caterory, class_name: "Caterory"
  has_many :resutl, class_name: "Result"
end
