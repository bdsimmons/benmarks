Benmarks::Application.routes.draw do
  devise_for :users
  get "pages/index"
  get "pages/about"

  root to: 'pages#index'
end
