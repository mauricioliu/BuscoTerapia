BuscoTerapia::Application.routes.draw do
  resources :terapias

  resources :ref_data

  get "buscar_terapeuta/find"

  resources :asesoria
  resources :terapeuta
  resources :sessions
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  
  match "change_password" => "terapeuta#change_password"
  match "forgot_password" => "terapeuta#forgot_password", :as => "forgot_password"
  match "reset_password" => "terapeuta#reset_password", :as => "reset_password"
  match "acceso_terapeutas" => "terapeuta#acceso_terapeutas", :as => "acceso_terapeutas"
  #match "buscar_terapeutas" => "terapeuta#index2", :as => "buscar_terapeutas"
  
  match '/ver_comprobante/:id' => 'asesoria#ver_comprobante', :as => 'ver_comprobante'
  

  # map.connect "/sessions/change_password", :controller => "sessions", :action => "change_password"
  # get "signup" => "users#new", :as => "signup"
  
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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
