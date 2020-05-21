class ProfilesController < ApplicationController
  def index
    if candidate_signed_in?
      @profile = Profile.find_by(candidate: current_candidate)
    end
  end

  def new
    if candidate_signed_in?
      @profile = Profile.new(candidate: current_candidate)
    end
  end

  def create
    if candidate_signed_in?
      @profile = Profile.new(profile_params)
      @profile.save

      redirect_to root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :social_name, :document,
      :birthdate, :formation, :description, :experience, :candidate)
  end
end