class HomeController < ApplicationController
  def index
    @jobapp = JobOpportunity.all
  end
end