Rails.application.routes.draw do
  root                'static_pages#home'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post   'signup' => 'users#create'
  resources :users
  resources :users do
  	member do
      get 'choose' => 'selection#choose'
    end
  end 
end
