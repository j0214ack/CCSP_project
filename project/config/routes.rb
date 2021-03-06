Project::Application.routes.draw do
  get "messages/index"

  get "messages/create"

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
  root :to => 'home#index'
  match '/home/slide' => 'home#slide'
  match '/user/login' => 'user#login', :via => 'post'
  match '/logout' => 'user#logout'
  
  Project::Application.routes.draw do

  get "messages/index"

  get "messages/create"
    get    '/user'                      => "user#index",   :as => "users"
    post   '/user'                      => "user#create",  :as => "users"
    get    '/user/new'                  => "user#new",     :as => "new_user"
    get    '/user/:username'            => "user#show",    :as => "user"
    put    '/user/:username'            => "user#update",  :as => "user"
    delete '/user/:username'            => "user#destroy", :as => "user"
    get    '/user/:username/edit'       => "user#edit",    :as => "edit_user"
    get    '/course'                    => "course#index", :as => "courses"
    post   '/course'                    => "course#upload",:as => "courses"
    delete '/course'                    => "course#destroy",:as => "course"
    get    '/record'                    => "course#recordpage",:as=>"course"
    post   '/record/:filename.(:format)'          => "course#record", :as => "course"
    get    '/record/data/:filename.(:format)'     => "course#playrecord",:as=>"course"
    post   '/data/:filename.(:format)'     => "course#playrecord",:as=>"course"
    get    '/download'                  => "course#download", :as=>"course"
    get    '/showUserDescribedCourse'   => "course#showUserDescribedCourse",:as=>"course" 
    get    '/newCourse'                 => "course#newCourse", :as =>"course"
    post   '/newCourse'                 => "course#createCourse", :as =>"course"
    post   '/sendjson'                  => "slide#sendingjson",      :as =>"slide"
    post   '/sendrequest'               => "slide#sendrequest", :as =>"slide" 
    get    '/home/newCourse'   => "course#newCourse"
    post    '/home/createCourse'   => "course#createCourse"
  end
  #resources :user
  resources :courselist
  resources :course
  resources :messages
end
