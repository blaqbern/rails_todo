AdvancedAr::Application.routes.draw do
  root to: 'todo_lists#index'
  resources :todo_lists do
    resources :todo_items
  end

  resources :accounts, only: [:show, :edit, :update]

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'
end
