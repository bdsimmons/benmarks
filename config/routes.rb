Benmarks::Application.routes.draw do
  resources :likes

  resources :benmarks

  resources :topics

  devise_for :users
  get "pages/index"
  get "pages/about"

  root to: 'pages#index'
end
