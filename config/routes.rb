# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
SampleApp::Application.routes.draw do




  resource :addcapcosts do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
   end

  resource :capusages do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :demands do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :maxaddcaps do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :preperiods do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :prodcaps do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :products do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :segments do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :solprodstors do
     collection do
       get 'view'
       get 'data'
     end
  end

  resource :solsegs do
     collection do
       get 'view'
       get 'data'
     end
  end

  resource :storagecosts do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :storagestarts do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resource :timesteps do
     collection do
       get 'view'
       get 'data'
       get 'dbaction'
     end
  end

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :problems
  resources :solutions
  get "configurations/view"

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/kontakt', :to => 'pages#kontakt'
  match '/about',   :to => 'pages#about'
  match '/faq',    :to => 'pages#faq'
  match 'problems/new', :to => 'problems#new'
  match 'problems/index', :to => 'problems#index'
  match 'configurations/optimize', :to => 'configurations#optimize'
  match 'solsegs/export', :to => 'solsegs#export'
  match 'solprodstors/export', :to => 'solprodstors#export'

  root :to => 'pages#startseite'
end