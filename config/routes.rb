Rails.application.routes.draw do
  root 'publics/articles#index'

  devise_for :publics, :controllers => {
    :sessions => 'publics/sessions',
    :registrations => 'publics/registrations'
  }
  devise_for :admins

  namespace :publics do
    resources :users, only: [:show, :edit, :update, :destroy]
    get 'users/:id/out' => 'users#out'
    resources :articles, only: [:index, :show]
    resources :interests, :only => [:create, :index, :destroy]

  end

  namespace :admins do
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :articles, only: [:index, :show, :create, :edit, :new, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
