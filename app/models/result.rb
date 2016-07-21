class Result < ApplicationRecord
  belongs_to :lesson, class_name: "Lesson"
  belongs_to :user, class_name: "User"
  belongs_to :word, class_name: "Word"
end
