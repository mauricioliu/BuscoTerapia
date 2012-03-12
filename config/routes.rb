BuscoTerapia::Application.routes.draw do
  get "admin/index"

  resources :articulos

  get "validar_terapeuta/index"
  get "validar_terapeuta/todos"
  get "validar_terapeuta/show"
  get "validar_terapeuta/validar"

  resources :pagos

  resources :terapias

  resources :ref_data

  get "buscar_terapeuta/find"

  resources :asesorias
  resources :terapeutas
  resources :sessions
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  
  match "preguntas_frecuentes" => "home#preguntas_frecuentes"
  match "condiciones_de_uso" => "home#condiciones_de_uso"
  match "privacidad" => "home#privacidad"
  
  # rutas terapeutas
  match "change_password" => "terapeutas#change_password"
  match "forgot_password" => "terapeutas#forgot_password", :as => "forgot_password"
  match "reset_password" => "terapeutas#reset_password", :as => "reset_password"
  match "acceso_terapeutas" => "terapeutas#acceso_terapeutas", :as => "acceso_terapeutas"
  match "validate_email" => "terapeutas#validate_email", :as => "validate_email"
  # match "submit_payment" => "terapeutas#submit_payment"
  match "payment_success" => "terapeutas#payment_success"
  match "plan_beneficios" => "terapeutas#plan_beneficios"
  match "contactar_terapeuta" => "terapeutas#contactar_terapeuta"
  match "estadisticas" => "terapeutas#estadisticas"
  
  match '/ver_comprobante/:id' => 'asesorias#ver_comprobante', :as => 'ver_comprobante'
  
  match '/validar_terapeuta/:id' => 'validar_terapeuta#show', :as => 'revisar_terapeuta'
  
  match '/validar_terapeuta/' => 'validar_terapeuta#index'
  match '/validar_terapeuta/:id/validar' => 'validar_terapeuta#validar', :as => 'validar'
  match '/validar_terapeuta/:id/edit' => 'validar_terapeuta#edit', :as => 'editar_terapeuta'
  match '/validar_terapeuta/:id/destroy' => 'validar_terapeuta#destroy', :as => 'destroy_terapeuta'
  match '/validar_terapeuta/:id/invalidar' => 'validar_terapeuta#invalidar', :as => 'invalidar_terapeuta'
  
  match '/admin' => 'admin#index', :as => 'admin'

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
