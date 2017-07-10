module ApplicationHelper
  def full_title page_title = ""
    base = t ".base_title"
    page_title.empty? ? base : page_title + " | " + base
  end

  def current_user? user
    user == current_user
  end
end
