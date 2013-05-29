Pinukimmm::Application.routes.draw do
  devise_for :users  # must be before RailsAdmin::engine
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :orders
  resources :products do
    collection do
      get 'galery'
    end 
  end

  resources :cart_items
  resources :carts
  resources :categories

  root :to => 'products#index'
  match 'current_cart' => 'carts#show'
  match 'current_cart_checkout' => 'carts#checkout'


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
#== Route Map
# Generated on 24 May 2013 11:41
#
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#              rails_admin        /admin                         RailsAdmin::Engine
#                   orders GET    /orders(.:format)              orders#index
#                          POST   /orders(.:format)              orders#create
#                new_order GET    /orders/new(.:format)          orders#new
#               edit_order GET    /orders/:id/edit(.:format)     orders#edit
#                    order GET    /orders/:id(.:format)          orders#show
#                          PUT    /orders/:id(.:format)          orders#update
#                          DELETE /orders/:id(.:format)          orders#destroy
#                 products GET    /products(.:format)            products#index
#                          POST   /products(.:format)            products#create
#              new_product GET    /products/new(.:format)        products#new
#             edit_product GET    /products/:id/edit(.:format)   products#edit
#                  product GET    /products/:id(.:format)        products#show
#                          PUT    /products/:id(.:format)        products#update
#                          DELETE /products/:id(.:format)        products#destroy
#               cart_items GET    /cart_items(.:format)          cart_items#index
#                          POST   /cart_items(.:format)          cart_items#create
#            new_cart_item GET    /cart_items/new(.:format)      cart_items#new
#           edit_cart_item GET    /cart_items/:id/edit(.:format) cart_items#edit
#                cart_item GET    /cart_items/:id(.:format)      cart_items#show
#                          PUT    /cart_items/:id(.:format)      cart_items#update
#                          DELETE /cart_items/:id(.:format)      cart_items#destroy
#                    carts GET    /carts(.:format)               carts#index
#                          POST   /carts(.:format)               carts#create
#                 new_cart GET    /carts/new(.:format)           carts#new
#                edit_cart GET    /carts/:id/edit(.:format)      carts#edit
#                     cart GET    /carts/:id(.:format)           carts#show
#                          PUT    /carts/:id(.:format)           carts#update
#                          DELETE /carts/:id(.:format)           carts#destroy
#               categories GET    /categories(.:format)          categories#index
#                          POST   /categories(.:format)          categories#create
#             new_category GET    /categories/new(.:format)      categories#new
#            edit_category GET    /categories/:id/edit(.:format) categories#edit
#                 category GET    /categories/:id(.:format)      categories#show
#                          PUT    /categories/:id(.:format)      categories#update
#                          DELETE /categories/:id(.:format)      categories#destroy
#                     root        /                              products#index
#             current_cart        /current_cart(.:format)        carts#show
# 
# Routes for RailsAdmin::Engine:
#     dashboard GET         /                                      rails_admin/main#dashboard
#         index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#           new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#        export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
#   bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# history_index GET         /:model_name/history(.:format)         rails_admin/main#history_index
#   bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#          show GET         /:model_name/:id(.:format)             rails_admin/main#show
#          edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#        delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
#  history_show GET         /:model_name/:id/history(.:format)     rails_admin/main#history_show
#   show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
