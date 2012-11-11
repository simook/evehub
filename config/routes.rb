DmpSite::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "registrations#new"
    get "/account" => "registrations#edit"
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  resources :users do
    resources :character, :only => :show do
      member do
        get 'info'
        get 'killlog'
        get 'employment'
        get 'skills'
      end
    end
    resources :corporation, :only => :show
  end
  resources :corporation, :only => :index
  resources :recruitment, :only => :index do
    collection do
      get 'hello'
      get 'welcome'
    end
  end
  namespace :eve do
    resources :items, :only => :show
    resources :skilltree, :only => :index
    resources :certificatetree, :only => :index
  end
end