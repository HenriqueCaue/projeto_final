class JobOpportunitiesController < ApplicationController
  before_action :authenticate_headhunter!, only: [:new, :create]

  def show
    @jobopp = JobOpportunity.find(params[:id])
  end

  def new
    @jobopp = JobOpportunity.new
  end

  def create
    @jobopp = JobOpportunity.new(job_params)
    @jobopp.active = true
    if @jobopp.save
      redirect_to @jobopp
    else
      render :new
    end
    
  end

  private

  def job_params
    params.require(:job_opportunity).permit(:title, :description, 
      :qualifications, :salary_range, :experience_level, :deadline, :location, 
      :active)
  end
end