class Activity < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :lesson, class_name: "Lesson"
end
