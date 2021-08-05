Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    resources :posts, only: %i[new create show]
    # resources :post, except: %i[destroy update]
    resources :users, only: :index do
    end
    root to: "users#index"
  end
end
