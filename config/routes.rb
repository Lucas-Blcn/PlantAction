Rails.application.routes.draw do
  devise_for :users
  root to: "plants#index"
  get '/pages', to: 'pages#my_posts', as: :my_posts
  get '/pages/my_bookings', to: 'pages#my_bookings', as: :my_bookings
  resources :plants do
    resources :bookings
  end
end
