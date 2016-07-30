class Lesson < ActiveRecord::Base
  after_create :update_name, :create_activity
  
  has_many :activities
  has_many :results
  
  belongs_to :user
  belongs_to :caterory

  def create_activity
    Activity.create!(activity_type: self.name,
      lesson_id: self.id, user_id: self.user.id)
  end

  def update_name
    update_attribute(:name, Settings.paragraph + self.caterory.name)
  end
end
