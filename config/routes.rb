Autoassist::Application.routes.draw do
  
  resources :pages

  Mercury::Engine.routes

  devise_for :users

    #devise_scope :users do

    #devise_for :users do
    #  match '/login' => "devise/sessions#new"
    #  match '/signup' => "devise/registrations#new"
    #  get "logout", :to => "devise/sessions#destroy"
    #end
    
    match '/myaccount/' => 'users#show', :as => :profile, :via => :get
    match '/myaccount/update' => 'users#edit', :as => :edit_profile, :via => :put
    
    devise_scope :user do
        get "signup", :to => "devise/registrations#new"
        get "login", :to => "devise/sessions#new"
        delete "logout", :to => "devise/sessions#destroy"
    end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :images
    #resources :users #do
    
    resources :articles do
        member { post :mercury_update }
    end
    
    scope :articles do
      match ':category/:id' => "articles#show", :as => :category, :via => [:get, :put]
    end
    
    post "/articles/:id", :to => "articles#mercury_update"
        #end
    
    #match 'articles' => 'articles#index', :as => :articles, :via => :get
    #match 'articles' => 'articles#new', :as => :new_articles, :via => :post

    

    #resources :user_sessions
    #resources :users, :only => ["show", "edit", "update"], :as => :profile, :path => 'profile/'
    # match '/:id' => 'users#show', :as => :p, path => '$/'
    
    match '/new' => 'pages#new', :as => :new_page, :via => :get
    match '/:id/edit' => 'pages#edit', :as => :edit_page, :via => :get
    match '/:id' => 'pages#show', :as => :page, :via => :get
    match '/:id' => 'pages#update', :via => :put
    match '/:id' => 'pages#destroy', :via => :delete
    
    
    
    #resource :user, :as => 'account'
    #resources :sessions, :only => [:new, :create, :destroy]

    
    #match '/signup', :to => 'users#new'
    #match '/login', :to => 'sessions#new'
    #match '/logout', :to => 'sessions#destroy'
    
    #get "pages/home"

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
    root :to => "pages#home"#, :controller => "articles"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
