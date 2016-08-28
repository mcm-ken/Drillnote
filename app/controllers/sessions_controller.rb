class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    '/project'
  end

  def after_inactive_sign_in_path_for(resource)
    '/project'
  end
end