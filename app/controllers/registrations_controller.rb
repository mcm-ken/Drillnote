class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    '/project/email'
  end

  def after_inactive_sign_up_path_for(resource)
    '/project/email'
  end
end