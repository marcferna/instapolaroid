Instapolaroid::Application.routes.draw do

  devise_for :users
  controller :callbacks do
    get "/callback"  => :callback_verification
    post "/callback" => :callback
  end

  resources :events

  root 'events#index'

  mount Resque::Server, :at => "/resque"
end
