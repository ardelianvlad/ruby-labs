Rails.application.routes.draw do
  root 'products#index', as: 'home'

  get 'about' => 'pages#about'
  
  resources :products do
  	resources :reviews
  end
end
