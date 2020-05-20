Rails.application.routes.draw do
  devise_for :candidates, path: 'candidates_accounts'
  resources :profiles, only: %i[index show]
  devise_for :headhunters
  root 'home#index'

  resources :job_opportunities, only: %i[show new create]
end
