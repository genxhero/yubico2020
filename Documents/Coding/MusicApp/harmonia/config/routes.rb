Rails.application.routes.draw do
  resources :users
  resource :session

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums

  resources :albums do
    resources :tracks
  end

  resources :tracks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
