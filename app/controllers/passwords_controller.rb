class PasswordsController < Devise::PasswordsController
  def after_sending_reset_password_instructions_path_for(resource)
    '/project/email'
  end
end