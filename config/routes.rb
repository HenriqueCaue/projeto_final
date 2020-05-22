Rails.application.routes.draw do
  devise_for :candidates
  resources :profiles, only: %i[index show new create]
  devise_for :headhunters
  root 'home#index'
  resources :applies, only: %i[show new create]
  resources :job_opportunities, only: %i[show new create]
end
