class SessionsController < Devise::SessionsController
  skip_before_action :check_user_onboarded
  protected

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
