module LessonsHelper
  def get_word_index(lesson, word_id)
    word_ids = lesson.learned_words.pluck(:id)
    index = word_ids.find_index word_id
    index + Settings.increase_index
  end

  def current_lesson
    current_user.lessons.last
  end
end
