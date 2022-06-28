class UsersController < ApplicationController
  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
    else
      redirect_back(fallback_location: onboarding_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_type)
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
