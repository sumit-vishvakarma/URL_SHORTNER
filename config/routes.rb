Rails.application.routes.draw do
  root "short_urls#new"
  resources :short_urls, only: [:new, :create, :show]
  get '/:short_code', to: 'short_urls#redirect', as: :redirect_short
end
