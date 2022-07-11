class ApplicationController < ActionController::Base
  before_action :check_user_onboarded
  before_action :authenticate_user!

  def onboarded?
    current_user.company.present? || current_user.charity.present?
  end

  def check_user_onboarded
    return unless current_user

    return if devise_controller?

    if !current_user.onboarded?
      redirect_to new_user_registration_path
    end
  end
end
