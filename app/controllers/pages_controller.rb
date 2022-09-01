class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :check_user_onboarded, only: [:home, :dashboard]

  def home
  end

  def dashboard
    # @claims = Claim.where("claim.company = current_user.company").or("claim.need.charity = current_user.charity")
    @claims = Claim.all.select{|claim| (claim.company == current_user.company) || (claim.need.charity == current_user.charity)}
  end

  def claims
    # @claims = Claim.where("claim.company = current_user.company").or("claim.need.charity = current_user.charity")
    @claims = Claim.all.select{|claim| (claim.company == current_user.company) || (claim.need.charity == current_user.charity)}
  end

  def history
    # @claims = Claim.where("claim.company = current_user.company OR claim.need.charity = current_user.charity")
    @claims = Claim.all.select{|claim| (claim.company == current_user.company) || (claim.need.charity == current_user.charity)}
  end

end
