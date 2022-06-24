class PagesController < ApplicationController
  def home
  end

  def dashboard
  end

  def onboarding
    @user = current_user
    if @user.save
      redirect_to dashboard_path
    else
      redirect_back(fallback_location: onboarding_path)
    end
  end
end
