DmpSite::Application.routes.draw do
  get "character/index"

  get "character/show"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users do
    resources :character
  end
  resources :recruitment
end