Project::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'

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
  
  Project::Application.routes.draw do
<<<<<<< HEAD
  get "home/index"

    get    '/user'                => "user#index",   :as => "users"
    post   '/user'                => "user#create",  :as => "users"
    get    '/user/:id'            => "user#show",    :as => "user"
    put    '/user/:id'            => "user#update",  :as => "user"
    delete '/user/:id'            => "user#destroy", :as => "user"
    get    '/user/new'            => "user#new",     :as => "new_user"
    get    '/user/:id/edit'       => "user#edit",    :as => "edit_user"
=======
    get    '/user'                      => "user#index",   :as => "users"
    post   '/user'                      => "user#create",  :as => "users"
    get    '/user/new'                  => "user#new",     :as => "new_user"
    get    '/user/:username'            => "user#show",    :as => "user"
    put    '/user/:username'            => "user#update",  :as => "user"
    delete '/user/:username'            => "user#destroy", :as => "user"
    get    '/user/:username/edit'       => "user#edit",    :as => "edit_user"
>>>>>>> 80ee58c04c581a714a998f7e0c8c8b206fa06eed
  end
  #resources :user
  resources :course
end
