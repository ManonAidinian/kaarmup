class ApplicationController < ActionController::Base
  before_action :check_user_onboarded
  before_action :authenticate_user!

  def onboarded?
    @onboarded = current_user.company.present? || current_user.charity.present?
  end

  def check_user_onboarded
    return unless onboarded?

    return if devise_controller?

    if !onboarded?
      if current_user.user_type == "Company"
        redirect_to new_company_path
      elsif current_user.user_type == "Charity"
        redirect_to new_charity_path
      end
    end
  end
end
