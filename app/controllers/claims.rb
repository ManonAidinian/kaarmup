class ClaimsController < ApplicationController
  def show
    @claims = Claim.find(params[:id])
  end

  def new
    @claims = Claim.new
    @need = Need.find(params[:need_id])
  end

  def create
    @need = Need.find(params[:need_id])
    @company = current_user.companies.first
    @claims = Claim.new(need_id: @need.id, company_id: @company.id)
    @claims.status = "Waiting for approval"
    @need.status = "Claimed, waiting for approval"
    if @claims.save! && @need.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    @claims = Claim.find(params[:id])
    @claims.status = "Approved and Rewarded"
    @need = @claims.need
    @need.status = "Solved"
    @claims.save!
    @need.save!
    @company = @claims.company
    @company.total_karma_points += @need.karma_points
    @company.save!
    redirect_to dashboard_path
  end

  def destroy
    @claims = Claim.find(params[:id])
    @claims.destroy
    redirect_to dashboard_path
  end

  private

  def claims_params
    params.require(:claims).permit(:need_id, :company_id)
  end
end
