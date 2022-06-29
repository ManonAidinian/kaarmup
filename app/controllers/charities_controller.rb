class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
  end

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    if @charity.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :description, :category, :location, :user_id)
  end
end
