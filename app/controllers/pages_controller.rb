class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :check_user_onboarded, only: :home

  def home
  end

  def dashboard
  end

  def claims
    @claims = Claim.all
  end

  def history
    @claims = Claim.all
  end

end
