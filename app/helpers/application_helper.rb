module ApplicationHelper
  # Return this to use in /app/views/layouts/_login.html.haml
  def get_user_name
    current_user ? current_user&.user_detail&.name : ""
  end
end
