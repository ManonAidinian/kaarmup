class UsersController < ApplicationController
  skip_before_action :check_user_onboarded

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
    else
      render :update
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_type, :photo)
  end
end
