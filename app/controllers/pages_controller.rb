class PagesController < ApplicationController
  skip_before_action :check_user_onboarded, only: :onboarding

  def home
  end

  def dashboard
  end

  def onboarding
  end
end
