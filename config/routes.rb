Rails.application.routes.draw do

  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#main'
  devise_for :users, controllers: {registrations: 'users/registrations'}

  devise_scope :user do
    get "change-password", to: "users/registrations#edit_password", as: "change_password"
    put "change-password", to: "users/registrations#update_password", as: "update_password"
  end

  get 'sign_up/start',         to: "sign_up#sign_up_type_selection",     as: "sign_up_type_selection"
  get 'sign_up/select',        to: "sign_up#user_type_selection",        as: "sign_up_user_type_selection"
  post 'sign_up/mentor',       to: "sign_up#set_as_mentor",              as: "sign_up_set_as_mentor"
  get 'sign_up/skill',         to: "sign_up#select_skill_category",      as: "sign_up_select_skill"
  get 'sign_up/about_you',     to: "sign_up#about_you",                  as: "sign_up_about_you"
  get 'sign_up/availability',  to: "sign_up#select_availability",        as: "sign_up_select_availability"
  get 'payment/index',         to: "accounts#index",                     as: "payment"
  post 'payment/index',         to: "accounts#create",                    as: "update_payment"
  post 'payment/pay',         to: "accounts#pay",                    as: "process_payment"
  get 'payment/transaction_result', to:"accounts#transaction_result",    as: "transaction_result"
  get 'payment/index_mentor',         to: "accounts#index_mentor",        as: "index_mentor"
  post 'payment/mentor_save',   to: "accounts#mentor_save",               as: "save_mentor"
  get 'payment/card_added',     to: "accounts#card_added",                as: "card_added"
  get 'transaction/index',      to: "transactions#index",                 as: "transaction_index"
  get 'payment/release_escrow',to: "accounts#release_escrow",            as: "release_escrow"
  
  get 'profiles/:id', to: "profiles#show", as: "public_profile"
  resource :profile, only: [:edit, :update] do
    get 'photos',     to: "profiles#photos", as: "photos"

    resource :availability, controller: "availability"
    match 'availability',  to: "profiles#update_availability",  as: "update_availability", via: :put
    resources :skills do
      post 'photo', to: "photos#create_skill_photo"
    end
    resources :verifications

  end

  resources :dashboard, only: [:index]
  resources :users, only: [:index]
  resources :categories
  resources :bookings

  resources :photos, only: [:destroy]


  get 'find-mentor',  to: "dashboard#find_mentor"
  get 'my_sessions',   to: "dashboard#my_sessions"
  get 'find-mentor/basics/:category_url_slug',  to: "bookings#find_mentor_basics",  as: "booking_find_mentor_basics"
  match 'find-mentors-browse',  to: "bookings#find_mentors_browse", as: "booking_find_mentors_browse", via: [:get, :post]

  match 'find-mentor-details',  to: "bookings#find_mentor_details", as: "booking_find_mentor_details", via: [:get, :post]
  match 'find-mentor-locations',  to: "bookings#find_mentor_locations", as: "booking_find_mentor_locations", via: [:get, :post]
  match 'find-mentor-notes',  to: "bookings#find_mentor_notes", as: "booking_find_mentor_notes", via: [:get, :post]
  match 'find-mentor-review',  to: "bookings#find_mentor_review", as: "booking_find_mentor_review", via: [:get, :post]
  match 'find-mentor-finalize',  to: "bookings#find_mentor_finalize", as: "booking_find_mentor_finalize", via: [:get, :post]


  match 'mentor-approve',  to: "bookings#mentor_approve", as: "booking_mentor_approve", via: [:get, :post]
  match 'mentor-reject',  to: "bookings#mentor_reject", as: "booking_mentor_reject", via: [:get, :post]
  match 'mentor-modification',  to: "bookings#mentor_modification", as: "booking_mentor_modification", via: [:get, :post]

  match 'mentee-modification-approve',  to: "bookings#mentee_modification_approve", as: "booking_mentee_modification_approve", via: [:get, :post]
  match 'mentee-modification-reject',  to: "bookings#mentee_modification_reject", as: "booking_mentee_modification_reject", via: [:get, :post]

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
