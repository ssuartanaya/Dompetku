Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  resources :users

  get 'users/:id/home', to: 'users#home', as: 'home'

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
