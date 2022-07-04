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
    @good_action.status = "Waiting for approval"
    @need.status = "Claimed, waiting for approval"
    if @good_action.save! && @need.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @good_action = GoodAction.find(params[:id])
    @good_action.destroy
    redirect_to dashboard_path
  end

  private

  def good_action_params
    params.require(:good_action).permit(:need_id, :company_id)
  end
end
