class AppliesController < ApplicationController
  def new
    @apply = Apply.new
    @jobopp = JobOpportunity.find(params[:id])
  end
end