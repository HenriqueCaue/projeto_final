Rails.application.routes.draw do
  devise_for :headhunters
  root 'home#index'

  resources :job_opportunities, only: %i[show new create]
end
