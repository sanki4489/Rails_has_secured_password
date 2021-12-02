Rails.application.routes.draw do
  root 'users#newhome'
  get 'signup', to: 'users#new'
  get 'home', to: 'users#home'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
