class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :check_user_onboarded
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_type, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end

  def after_sign_up_path_for(resource)
    if current_user.user_type == "Charity"
      new_charity_path
    elsif current_user.user_type == "Company"
      new_company_path
    end
  end

  def after_update_path_for(resource)
    flash[:notice] = "Account succesfully updated"
    dashboard_path
  end
end
