Rails.application.routes.draw do
  resources :blurbs, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :slack do
    resources :messages, only: [:create]
    resources :mentions, only: [:create]
  end
end
