Rails.application.routes.draw do
  get "/:locale" => "posts#index"
  root "posts#index"

  scope "(:locale)", locale: /en|pt-BR/ do
    devise_for :users

    get "posts/new/auto", to: "posts#new", as: :auto_post
    post "posts/new/auto", to: "posts#queue", as: :queue

    resources :posts do
      get "/page/:page", action: :index, on: :collection
      resources :comments, only: [:create, :destroy]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
