class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if current_user.user_type == "Charity"
      new_charity_path
    elsif current_user.user_type == "Company"
      new_charity_path
    end
  end
end
