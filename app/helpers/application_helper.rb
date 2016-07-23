module ApplicationHelper
  def full_title(title)
    base_title = t("title.base_title")
    title.empty? ? base_title : (title + " | " + base_title)
  end
end
