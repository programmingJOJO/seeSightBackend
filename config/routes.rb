Rails.application.routes.draw do
  resources :tags
  resources :challenge_protocols
  resources :hints
  resources :tours
  resources :challenges do
    collection do
      get :place
    end
  end
  resources :cities
  resources :places do
    member do
      get :challenges
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
