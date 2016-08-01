class Lesson < ActiveRecord::Base
  after_create :update_name, :create_activity, :add_words

  has_many :activities, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :learned_words, through: :results, source: :word

  belongs_to :user
  belongs_to :caterory

  def create_activity
    Activity.create!(activity_type: self.name,
      lesson_id: self.id, user_id: self.user.id)
  end

  def update_name
    update_attribute(:name, Settings.paragraph + self.caterory.name)
  end

  def add_word(word)
    results.create(word_id: word.id, user_id: self.user.id)
  end

  def add_words
    words = self.caterory.words.not_learned(self.user_id).order("RAND()").limit(Settings.maximum_words_in_lesson)
    words.each do |word|
      add_word(word)
    end    
  end

  def find_result(word_id)
    self.results.find_by(word_id: word_id)
  end
end
