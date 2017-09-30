Rails.application.routes.draw do
  get 'events/index'

  root 'dashboard#root'

  get 'login' => 'session#login'
  get 'register' => 'session#register'
  post 'users' => 'users#create'
  post 'session' => 'session#create'
  delete 'session/:id' => 'session#destroy'


  get 'apod' => 'dashboard#apod'
  get 'images' => 'image#show'

  get 'users/:id/main' => 'users#main'
  get 'users/:id/show' => 'users#show'
  get 'users/:id/profile' => 'users#profile'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  get 'users/:id/images' => 'users#userimages'

  get 'events' => 'events#index'
  get 'events/new' => 'events#new'
  post 'events' => 'events#create'
  get 'events/:id' => 'events#show'
  delete 'events/:id' => 'events#destroy'
  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id' => 'events#update'
  get 'events/state/:state' => 'events#index'


  post 'attendees/:id' => 'attendees#create'
  delete 'attendees/:id' => 'attendees#destroy'

  get 'images/new' => 'image#new'
  post 'newimages'  => 'image#create'
  get 'images/:id/show' => 'image#imageshow'

  post 'likes/:id' => 'like#create'
  post 'friendship'=> 'friendship#create'
  delete 'friendship/:id' => 'friendship#destroy'

  post 'images/:id/comment' => 'comment#imagecomment'
  post 'events/:id/comment' => 'comment#eventcomment'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
