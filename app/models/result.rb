class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :word

  scope :find_correct, ->(correct){where("results.status = ?", correct)}
end
