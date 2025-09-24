Rails.application.routes.draw do
  # Web routes
  
  root "short_urls#new"
  resources :short_urls, only: [:new, :create, :show]
  get '/:short_code', to: 'short_urls#redirect', as: :redirect_short

  # API routes
  namespace :api do
    namespace :v1 do
      resources :short_urls, only: [:create]
    end
  end
end
