class CompaniesController < ApplicationController
skip_before_action :check_user_onboarded, only: [:new, :create]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :location, :user_id, photos: [])
  end
end
