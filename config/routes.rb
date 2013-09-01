Omrails::Application.routes.draw do

  resources :certificates


  resources :job_experiences


  resources :job_applications
  match 'job_applications/:id' => 'job_applications#show', as: :job_application


  resources :job_postings, shallow: true do
  resources :job_applications
  end


  resources :pins


  devise_for :users
  match 'users/:id' => 'users#show', as: :user

  get 'about' => 'pages#about'

  root :to => 'pages#home'

  get 'bryan' => 'pages#bryan'

  get 'dad' => 'pages#dad'

  get 'vip' => 'pages#vip'

  get 'job_post' => 'pages#job_post'

  get 'my_job_postings' => 'job_postings#my_index'

  get 'job_posting_applications' => 'job_postings#show_applications'
 
  match '/certificates/pdf/:id' => 'certificates#pdf'

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
