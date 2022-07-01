class NeedsController < ApplicationController
  def new
    @need = Need.new
    @charity = Charity.find(params[:charity_id])
  end

  def create
    @need = Need.new(need_params)
    @need.charity = Charity.find(params[:charity_id])
    @charity = @need.charity
    if @need.save
      redirect_to charity_path(@charity.id)
    else
      render :new
    end
  end

  def edit
    @need = Need.find(params[:id])
  end

  def update
    @need = Need.find(params[:id])
    if @need.update(need_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def need_params
    params.require(:need).permit(:title, :description, :category, :karma_points, :charity_id)
  end
end
