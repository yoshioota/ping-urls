Rails.application.routes.draw do

  resources :ping_url_results

  resources :ping_urls do
    get :check, on: :member
  end

  root 'ping_urls#index'

end
