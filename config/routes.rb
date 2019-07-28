Rails.application.routes.draw do
  resources :blurbs, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :slack_events, only: [:create]
end
