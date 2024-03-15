Rails.application.routes.draw do
  get 'current_user/index'
  devise_for :users, path: '', path_names: {
    sign_in: "login",
    sign_out: "logout",
    registrations: "signup"
  },
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/current_user', to: 'current_user#index'

  # Authentication

  # Users
  get '/users', to: "users#index"                           # Get a list of users.
  get '/users/:id', to: "users#show"                        # Get details of a specific user by ID.
  patch '/users/:id/update_profile', to: "users#update"     # Update user profile information.
  get '/users/:id/skills', to: "users#skills"               # Get user's skills.
  get '/users/:id/gigs', to: "users#gigs"                   # Get user's gigs.
  get '/users/:id/reviews', to: "users#reviews"             # Get user's reviews.
  get '/users/:id/orders', to: "users#orders"               # Get user's orders.
  get '/users/:id/withdrawals', to: "users#withdrawals"     # Get user's withdrawal history.

  # Gigs
  get '/gigs', to: "gigs#index"                             # Get a list of all gigs.
  get '/gigs/:id', to: "gigs#show"                          # Get details of a specific gig by ID.
  post '/gigs/create', to: "gigs#create"                    # Create a new gig.
  patch '/gigs/:id/update', to: "gigs#update"               # Update details of a gig.
  delete '/gigs/:id/delete', to: "gigs#destroy"             # Delete a gig.
  get '/gigs/:id/orders', to: "gigs#orders"                 # Get orders for a specific gig.

  # Orders
  get '/orders', to: "orders#index"                         # Get a list of orders.
  get '/orders/:id', to: "orders#show"                      # Get details of a specific order by ID.
  post '/orders/create', to: "orders#create"                # Create a new order.
  patch '/orders/:id/update_status', to: "orders#update"    # Update the status of an order.
  delete '/orders/:id/cancel', to: "orders#destroy"         # Cancel an order.
  patch '/orders/:id/deliver', to: "orders#deliver"         # Mark an order as delivered.

  # Reviews/Ratings
  get '/reviews', to: "reviews#index"                       # Get a list of reviews.
  get '/reviews/:id', to: "reviews#show"                    # Get details of a specific review by ID.
  post '/reviews/create', to: "reviews#create"              # Create a new review.
  patch '/reviews/:id/update', to: "reviews#update"         # Update a review.
  delete '/reviews/:id/delete', to: "reviews#destroy"       # Delete a review.

  # Messages/Chats
  get '/messages', to: "messages#index"                     # Get a list of messages.
  get '/messages/:id', to: "messages#show"                  # Get details of a specific message by ID.
  post '/messages/create', to: "messages#create"            # Create a new message.
  patch '/messages/:id/update', to: "messages#update"       # Update a message.
  delete '/messages/:id/delete', to: "messages#destroy"     # Delete a message.

  # Notifications
  get '/notifications', to: "notifications#index"                         # Get a list of notifications.
  get '/notifications/:id', to: "notifications#show"                      # Get details of a specific notification by ID.
  patch '/notifications/:id/mark_as_read', to: "notifications#update"     # Mark a notification as read.
  delete '/notifications/:id/delete', to: "notifications#destroy"         # Delete a notification.

  # Favorites/Bookmarks
  get '/favorites', to: "favorites#index"                     # Get a list of favorites/bookmarks.
  post '/favorites/create', to: "favorites#create"            # Add a gig to favorites.
  delete '/favorites/:id/delete', to: "favorites#destroy"     # Remove a gig from favorites.

  # Withdrawals/Payments
  get '/withdrawals', to: "withdrawals#index"                             # Get a list of withdrawals.
  post '/withdrawals/create', to: "withdrawals#create"                    # Initiate a withdrawal request.
  patch '/withdrawals/:id/update_status', to: "withdrawals#update"        # Update the status of a withdrawal request.

  # Reports
  get '/reports', to: "reports#index"                         # Get a list of reports.
  post '/reports/create', to: "reports#create"                # Submit a report.
  patch '/reports/:id/update', to: "reports#update"           # Update a report.
  delete '/reports/:id/delete', to: "reports#destroy"         # Delete a report.

  # Search
  get '/search/gigs', to: "search#gigs"         # Search for gigs using keywords or filters.
  get '/search/users', to: "search#users"       # Search for users using keywords or filters.

  # Tags/Skills
  get '/tags', to: "tags#index"                 # Get a list of tags/skills.
  get '/tags/:id', to: "tags#show"              # Get details of a specific tag/skill by ID.

  # Analytics
  get '/analytics/gigs', to: "analytics#gigs"         # Get analytics data for gigs.
  get '/analytics/users', to: "analytics#users"       # Get analytics data for users.

  # Subscription/Pricing Plans
  get '/subscriptions/plans', to: "subscriptions#plans"                   # Get a list of subscription/pricing plans.
  post '/subscriptions/:id/subscribe', to: "subscriptions#subscribe"      # Subscribe to a plan.

  # Miscellaneous
  get '/ping', to: 'ping#index'               # Check if the API server is running.
  get '/docs', to: 'docs#index'               # Documentation for the API endpoints.
  
  # Defines the root path route ("/")
  # root "posts#index"
end
