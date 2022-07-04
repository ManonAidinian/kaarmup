class CharitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @charities = Charity.search_globally(params[:query])
    else
      @charities = Charity.all
    end
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

  def edit
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    redirect_to dashboard_path
  end

  private

  def charity_params
    params.require(:charity).permit(:name, :description, :category, :location, :user_id, :photo)
  end
end
