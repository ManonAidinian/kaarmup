class NeedsController < ApplicationController
  def new
    @need = Need.new
  end

  def create
    @need = Need.new(need_params)
    @need.charity = Charity.find(params[:charity_id])
    @charity = @need.charity
    if @need.save
      redirect_to charity_path(@charity)
    else
      render :new
    end
  end

  private

  def need_params
    params.require(:need).permit(:title, :description, :category, :karma_points, :charity_id)
  end
end
