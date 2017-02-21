Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :user_comments, only: [:new, :create, :destroy]
    resources :goals, only: [:new, :create, :show, :index, :destroy] do
      resources :goal_comments, only: [:new, :create, :destroy]
    end
  end


  resource :session, only: [:new, :create, :destroy]
end
