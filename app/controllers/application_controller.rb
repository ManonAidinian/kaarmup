class ApplicationController < ActionController::Base
  before_action :check_user_onboarded
  before_action :authenticate_user!

  def check_user_onboarded
    return unless current_user

    return if devise_controller?

    if !current_user.onboarded?
      redirect_to onboarding_path
    end
  end
end
