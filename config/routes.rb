Rails.application.routes.draw do
  
  root 'welcome#index'


  # get 'clients' => 'clients#show'


  post 'clients/create' => 'clients#create'
  
  get 'clients' => 'clients#show'

  get 'companies/clients/new' => 'clients#new'

  get 'clients/:id' => 'clients#show'

  delete 'companies/clients/:id' => 'clients#destroy'

  post 'clients' => 'clients#create'

  get 'companies/clients/:id/edit' => 'clients#edit'

  post 'clients/update' => 'clients#update'

  get 'companies/clients/:id' => 'clients#show' 
  
  get 'companies/clients/:id/edit' => 'clients#edit'
  
  post 'companies' => 'companies#create'

  get 'companies/edit' => 'companies#edit'

  get '/companies/reports' => 'reports#year'

  get '/companies/reports/1st' => 'reports#oneq'
  get '/companies/reports/2nd' => 'reports#twoq'
  get '/companies/reports/3rd' => 'reports#threeq'
  get '/companies/reports/4th' => 'reports#fourq'



  get '/companies/reports/quarter/:id/:id2' => 'reports#quarter'
  get '/companies/reports/year/:id' => 'reports#year'



  get '/register' => 'companies#new', as: :this_new_company

  delete '/sessions' => 'sessions#destroy'
  
  resources :sessions

  get '/companies' => 'dashboards#index', as: :companies_main

  get 'companies/destroy' => 'clients#destroy'

  patch 'invoices/add/:id' => 'invoices#addCheck'

  # resources :clients

  resources :dashboards

  resources :charges

  get 'companies/invoices/:id' => 'invoices#show' 

  get 'clients/invoices/:id' => 'invoices#show'  

  resources :invoices


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
