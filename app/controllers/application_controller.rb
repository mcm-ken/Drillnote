class ApplicationController < ActionController::Base

  before_filter :basic

  private
  def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'drillnote' && pass == 'kentaro'
    end
  end

  def after_sign_in_path_for(resource)
    '/project'
  end

  def after_sign_out_path_for(resource)
    '/project/top'
  end

  def after_sign_up_path_for(resource)
    '/project'
  end

  def after_inactive_sign_up_path_for(resource)
    '/project'
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
