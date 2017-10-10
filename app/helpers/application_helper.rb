module ApplicationHelper
  def recognize_path
    Rails.application.routes.recognize_path(request.referrer)
  end

  def is_home?
    controller_name == 'pages' && action_name == 'home'
  end

  def come_from_home?
    controller_name == 'places' && action_name == 'index' && recognize_path[:controller] == "pages"
  end
end
