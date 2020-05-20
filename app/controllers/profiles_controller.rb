class ProfilesController < ApplicationController
  def index
    if candidate_signed_in?
      @profile = Profile.find_by(candidate: current_candidate)
    end
  end
end