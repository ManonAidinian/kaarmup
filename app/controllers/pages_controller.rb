class PagesController < ApplicationController
  skip_before_action :check_user_onboarded, only: :onboarding
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    if current_user.user_type == "Company"
      @good_actions = GoodAction.where(company_id: current_user.companies.first.id)
    end
  end

  def onboarding
  end
end
