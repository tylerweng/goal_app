Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :goals, only: [:new, :create, :show, :index, :destroy]
  end


  resource :session, only: [:new, :create, :destroy]
end
