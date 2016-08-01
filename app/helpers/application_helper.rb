module ApplicationHelper
  def full_title(title)
    base_title = t("helper.application.base_title")
    title.empty? ? base_title : (title + " | " + base_title)
  end
end
