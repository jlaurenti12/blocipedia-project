Rails.application.routes.draw do

  get 'about' => 'welcome#about'

  devise_for :users

  resources :wikis

  resources :charges, only: [:new, :create]

  resources :users do
    member do
      post :downgrade
    end
  end

  root 'welcome#index'

end
