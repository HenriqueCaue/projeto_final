class HomeController < ApplicationController
  def index
    @jobapp = JobOpportunity.all

    #if candidate_signed_in?
    #  if Profile.find_by(candidate: current_candidate).nil?
    #    redirect_to new_profile_path
    #    flash[:notice] = 'Preencha seu perfil antes de se candidatar'
    #  end
    #end
    
  end
end