class UsersController < ApplicationController
  skip_before_action :check_user_onboarded

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
    else
      # redirect_back(fallback_location: onboarding_path)
      render "pages/onboarding"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_type, :photo)
  end
end


# def edit
# @task = Task.find(params[:id])
# end

# def update
# @task = Task.find(params[:id])
# @task.update(task_params)
# redirect_to task_path(@task)
# end
