module ApplicationHelper
  def render_created_at(created_at)
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
