class GoodActionsController < ApplicationController
  def show
    @good_action = GoodAction.find(params[:id])
  end

  def new
    @good_action = GoodAction.new
    @need = Need.find(params[:need_id])
  end

  def create
    @need = Need.find(params[:need_id])
    @company = current_user.companies.first
    @good_action = GoodAction.new(need_id: @need.id, company_id: @company.id)
    @need.status = "Claimed, waiting for approval"
    if @good_action.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def good_action_params
    params.require(:good_action).permit(:need_id, :company_id)
  end
end