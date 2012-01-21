# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
SampleApp::Application.routes.draw do
  get "problems/new"

  get "addcapcosts/new"

  get "maxaddcaps/new"

  get "storagecosts/new"

  get "capusages/new"

  get "demands/new"

  get "prodcaps/new"

  get "segments/new"

  get "timesteps/new"

  get "preperiods/new"

  get "products/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :products
  resources :addcapcosts
  resources :maxaddcaps
  resources :storagecosts
  resources :capusages
  resources :demands
  resources :prodcaps
  resources :segments
  resources :timesteps
  resources :preperiods
  resources :problems

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/kontakt', :to => 'pages#kontakt'
  match '/about',   :to => 'pages#about'
  match '/faq',    :to => 'pages#faq'

  root :to => 'pages#startseite'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
