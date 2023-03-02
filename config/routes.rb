Rails.application.routes.draw do
  get 'dashboards/index', as: :dashboards
  resources :logins, only: %i[new create]
  resources :registrations, only: %i[new create]

  # root "articles#index"
  root 'posts#index'
  resources :posts

end
