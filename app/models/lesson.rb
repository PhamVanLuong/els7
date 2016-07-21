class Lesson < ApplicationRecord
  belongs_to :caterory, class_name: "Caterory"
  has_one :activity, class_name: "Activity"
  has_many :result, class_name: "Result"
end
