Strongparams::Application.routes.draw do
  resources :users, only: [:create]
end
