Launcherr::Application.routes.draw do
  get "messages/index"
  post "messages/join_team"
  mount Ckeditor::Engine => '/ckeditor'
  get '/page/index' => redirect('/page')
  get "pages/jobs"
  get "pages/press"
  get "pages/help"
  get "pages/policies"
  get "pages/terms"
  get "pages/privacy"
  get "pages/trustsafety"
  get "pages/invitefriends"
  get "pages/projectswelove"
  get "pages/mobile"
  get "pages/supportcreativity"
  get "pages/sitemap"
  get "pages/prepareproject"
  get "pages/protectingyouridea"
  get "pages/projectguidelines"
  get "pages/stories"
  get "pages/joiningteams"
  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts  do  #->Prelang (voting/acts_as_votable)
  collection do
    get "my_project"
    get "inbox"
    get "pending_page"
  end
  member do
    get "vote"
  end
end
 namespace :api do
   namespace :ajax do
    resources :chat_filter_ajax
    resources :add_chat_ajax
    resources :chat_remove_ajax
    resources :request_chat_ajax do
      post "refresh_unreadMessages_ajax", on: :collection

    end
  end
 end

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  namespace :httpapi do 
      namespace :v1 do 
        get "change_switch" => "change_switch#index"
      end
    
  end
  # You can have the root of your site routed with "root"
  root 'posts#index'
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
  
  # Custom Pages
   


  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "devise/sessions#new",         as: :new_user_session
    post   "login"   => "devise/sessions#create",      as: :user_session
    delete "signout" => "devise/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end

end
