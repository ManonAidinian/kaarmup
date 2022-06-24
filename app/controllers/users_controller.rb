class UsersController < ApplicationController
  def update
    if current_user.save
      redirect_to dashboard_path
    else
      redirect_back(fallback_location: onboarding_path)
    end
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
