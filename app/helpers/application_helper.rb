module ApplicationHelper
  def full_title page_title = ""
    base = t ".base_title"
    page_title.empty? ? base : page_title + " | " + base
  end
end
