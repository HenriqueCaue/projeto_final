Rails.application.routes.draw do
  devise_for :candidates
  resources :profiles, only: %i[index show new create]
  devise_for :headhunters
  root 'home#index'

  resources :job_opportunities, only: %i[show new create]
end
