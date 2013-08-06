Twenty::Application.routes.draw do

  get "apps" => "apps#index"

  get "admin/index"

  
  controller :users do
    match 'users' => :index
    get 'signup' => :new
    post 'signup' => :create
    get 'setting' => :edit
    post 'setting' => :update
    match 'user/:id' => :show
  end

  resources :blogs


  controller :post do
    root :to => :index
    get 'post/:id' => :show, :as => :post
    get 'post/:id/:act' => :actions
  end

  
  controller :sessions do
    get 'signin' => :new
    post 'signin' => :create
    get 'logout' => :destroy
  end

  controller :authorize do
    match "authorize/:act" => :entry
  end

  controller :api do
    match 'api' => :index
    match 'api/:api/:act' => :entry
  end
  # match ':id' => 'post#show'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
