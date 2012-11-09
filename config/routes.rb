Wave::Application.routes.draw do
  root :to => 'home#index'

  match '/soc_wave_list' => 'soc_wave_list#index'
  match '/soc_wave_list/wave_detail' => 'soc_wave_list#wave_detail'
  match '/soc_wave_list/wave_final' => 'soc_wave_list#wave_final'
  match '/soc_wave_list/login' => 'soc_wave_list#login'
  match '/soc_wave_list/callback' => 'soc_wave_list#callback'
  match '/soc_wave_list/friendList' => 'soc_wave_list#friendList'
  

  match '/loc_wave_list' => 'loc_wave_list#index'
  match '/loc_wave_list/wave_detail' => 'loc_wave_list#wave_detail'
  match '/loc_wave_list/wave_final' => 'loc_wave_list#wave_final'

  match '/soc_mood_picker' => 'soc_mood_picker#index'

  match '/friend_circle' => 'friend_circle#index'
  match '/friend_circle/circles' => 'friend_circle#circles'
  match '/friend_circle/waves' => 'friend_circle#waves'
  match '/friend_circle/delete' => 'friend_circle#delete'  

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
  # root :to => 'welcome'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
