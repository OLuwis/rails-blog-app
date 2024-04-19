Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    get "/page/:page", action: :index, on: :collection
    resources :comments, only: [:new, :create, :destroy]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
