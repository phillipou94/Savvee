Rails.application.routes.draw do
  root                'static_pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post   'signup' => 'users#create'
  resources :users

  post 'create_topic' => 'topics#create'
  resources :topics
  resources :relationships,       only: [:create, :destroy]

  
end
