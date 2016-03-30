Rails.application.routes.draw do
  resources :tags, except: [:destroy, :create]
  resources :challenge_protocols, except: [:destroy]
  resources :hints, except: [:destroy]
  resources :tours, except: [:destroy]
  resources :users, param: :token, except: [:destroy, :index]
  resources :user_tours, except: [:destroy]
  resources :user_tour_places, except: [:destroy]
  resources :user_tour_challenges, except: [:destroy]
  resources :challenges, except: [:destroy] do
    collection do
      get :place
    end
  end
  resources :cities, except: [:destroy]
  resources :places, except: [:destroy] do
    member do
      get :challenges
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
