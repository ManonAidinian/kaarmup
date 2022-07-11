class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_type, :photo])
 end

  def after_sign_up_path_for(resource)
    if current_user.user_type == "Charity"
      new_charity_path
    elsif current_user.user_type == "Company"
      new_company_path
    end
  end
end
