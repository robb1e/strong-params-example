Strongparams::Application.routes.draw do
  resources :users, only: [:create, :update]
  root to: "users#index"
end
