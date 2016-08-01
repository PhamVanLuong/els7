class Word < ActiveRecord::Base
  after_create :add_answers

  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  
  belongs_to :caterory
  
  validates :learning_word, presence: true, length: {maximum: Settings.maximum_word}
  validates :meaning, presence: true, length: {maximum: Settings.maximum_meaning}

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes[:mean].blank?}

  def add_answers
    Settings.maximum_ans.times do
      self.answers.create!(mean: Word.random_answer)
    end
    self.answers.sample.update_attributes(mean: self.meaning)
  end

  def self.random_answer
    Word.all.sample.meaning
  end

  def id_to_symbol
    self.id.to_s.to_s
  end

  scope :not_learned, ->(current_user_id){
    where("words.id not in (select word_id from results where user_id = ?)", current_user_id)}
end
