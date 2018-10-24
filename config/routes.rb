Rails.application.routes.draw do

  root to: "application#home"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'

# Edit all trips for a user
  get '/users/:user_id/trips/edit', to: 'trips#edit', as: 'edit_user_trips'

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :trips, only: [:new, :create, :update, :index]
  end

  resources :cities, only: [:show, :index, :new, :create]
  resources :reviews, only: [:new, :create]

end
