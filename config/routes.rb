Strongparams::Application.routes.draw do
  resources :users, only: [:create, :update]
end
