Rails.application.routes.draw do

  get 'about' => 'welcome#about'

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]

  post "/users/:id/downgrade" => "users#downgrade", as: "downgrade_user"

  root 'welcome#index'

end
