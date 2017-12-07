Rails.application.routes.draw do

  get 'about' => 'welcome#about'

  devise_for :users

  resources :wikis do
    resources :collaborators, only: [:new, :create, :update, :destroy]
  end

  resources :charges, only: [:new, :create]

  post "/users/:id/downgrade" => "users#downgrade", as: "downgrade_user"

  root 'welcome#index'

end
