Rails.application.routes.draw do
  # get 'order_items/create'
  #
  # get 'order_items/update'
  #
  # get 'order_items/destroy'
  #
  # get 'carts/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  scope '/:locale', locale: /es|en/ do
    resources :categories do
      resources :products
    end
    resources :admins
    resources :search, only: [:index]
    root 'pages#home'
    get '/clients/new', to: 'clients#new', as: 'clients'
    post '/clients', to: 'clients#create'
    get '/clients', to: 'clients#show', as: 'clients_show'
    get '/clients/edit', to: 'clients#edit'
    patch '/clients/update', to: 'clients#update'
    patch '/clients/update_pass', to: 'clients#update_password'
    get '/express_checkout', to: 'buys#express_checkout'
    get '/checkout_details', to: 'buys#checkout_details'
    post '/purchase', to: 'buys#purchase'
    resources :carts, only: [:index]
    resources :order_items, only: [:create, :update, :destroy]
    get '/:static', to: 'pages#static', as: 'static'
    devise_for :users, :controllers => {:passwords => 'passwords', registrations: 'registrations'}
  end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
