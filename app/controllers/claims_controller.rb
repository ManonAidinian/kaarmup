require 'date'

class ClaimsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_onboarded

  def show
    @claim = Claim.find(params[:id])
    @need = @claim.need
    @company = @claim.company
    @charity = @claim.need.charity
    @karma_points = @claim.need.karma_points
  end

  def create
    @need = Need.find(params[:need_id])
    @company = current_user.company
    @claim = Claim.new(need_id: @need.id, company_id: @company.id)
    @claim.status = "Waiting for approval"
    @need.status = "Claimed and waiting for approval"
    @claim.save! && @need.save!
    redirect_to claim_path(@claim.id)
  end

  def approve
    @claim = Claim.find(params[:claim_id])
    @claim.status = "Approved"
    @need = @claim.need
    @claim.save!
    @need.status = "Claimed"
    @need.save!
    @company = @claim.company
    redirect_to claim_path(@claim.id)
  end

  def close
    @claim = Claim.find(params[:claim_id])
    @claim.status = "Processed and Rewarded"
    @need = @claim.need
    @need.status = "Solved"
    @closing_time = DateTime.now.strftime(" %b %e, %Y at %l:%M%p")
    @claim.save!
    @need.save!
    @company = @claim.company
    @company.total_karma_points += @need.karma_points
    @company.save!
    redirect_to claim_path(@claim.id)
  end

  def destroy
    @claim = Claim.find(params[:id])
    @claim.destroy
    redirect_to dashboard_path
  end

  private

  def claim_params
    params.require(:claim).permit(:need_id, :company_id, :status)
  end
end
