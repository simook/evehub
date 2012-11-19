DmpSite::Application.routes.draw do
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "registrations#new"
    get "/account" => "registrations#edit"
    get "/api" => "registrations#api"
    get "/corp/id" => "registrations#corpid"
    get "/corp/api" => "registrations#corpapi"
  end

  devise_for :users, :controllers => {
    :registrations => "registrations",
    :sessions => "sessions",
    :confirmations => "confirmations"
  }

  resources :character, :only => :show do
    member do
      get 'info'
      get 'killlog'
      get 'employment'
      get 'skills'
    end
  end
  resources :corporation do
    collection do
      get 'account'
      get 'starbase/list' => "corporation#starbaselist"
      get 'member/tracking' => 'corporation#membertracking'
      get 'starbase/detail/:id' => 'corporation#starbasedetail', as: :starbase_detail
      get 'starbase/location/:id' => 'corporation#starbaselocation', as: :starbase_location
    end
  end

  resources :recruitment, :only => :index do
    collection do
      get 'hello'
      get 'welcome'
    end
  end

  resources :posts

  namespace :eve do
    resources :items, :only => :show
    resources :skilltree, :only => :index
    resources :certificatetree, :only => :index
    resources :apikeyinfo, :only => :index
    resources :status, :only => :index
  end

  namespace :admin do
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
    resources :corporations
  end

  root :to => "home#index"
end