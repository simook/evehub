DmpSite::Application.routes.draw do
  get "corporation/show"

  get "character/index"

  get "character/show"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users do
    resources :character, :only => :show
    resources :corporation, :only => :show
  end
  resources :recruitment
end