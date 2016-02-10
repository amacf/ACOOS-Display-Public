Rails.application.routes.draw do

  root 'static_pages#home'

  get 'keyOpen' => 'people#openKeyboard'
  get 'keyClose' => 'people#closeKeyboard'

  get '' => 'static_pages#home'
  get 'nav' => 'static_pages#nav'
  get 'people' => 'people#kioskIndex'
  get 'kioskPeople/:id' => 'people#kioskPeople'
  get 'artifacts' => 'static_pages#artifacts'
  get 'artifacts/churchHistory' => 'static_pages#churchHistory'
  get 'artifacts/genocideHistory' => 'static_pages#genocideHistory'
  get 'artifacts/genocideMap' => 'static_pages#genocideMap'
  get 'artifacts/saroyanQuote' => 'static_pages#saroyanQuote'
  get 'artifacts/aroianHistory' => 'static_pages#aroianHistory'
  get 'artifacts/kazarianHistory' => 'static_pages#kazarianHistory'

  get 'admin' => 'people#index'
  get 'admin/newPerson' => 'people#new'
  get 'admin/showPerson/(/:id)' => 'people#show', as: "admin_showPerson"
  get 'admin/editPerson/:id' => 'people#edit', as: "admin_editPerson"
  patch 'admin/showPerson/:id' => 'people#update'
  put 'admin/showPerson/:id' => 'people#update'
  post 'admin/showPerson' => 'people#create';
  delete 'admin/deletePerson/:id' => 'people#destroy', as: "admin_deletePerson"

  get 'admin/background' => 'background_images#index'
  delete 'admin/deleteBackground/:id' => 'background_images#destroy', as: "admin_deleteBackground"
  post 'admin/showBackground' => 'background_images#create';
  get 'admin/newBackground' => 'background_images#new'
  #resources :people;

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
