Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    resources :posts, only: %i[new create show]
    resources :users, only: :index do
      resources :relationships, only: %i[create destroy], shallow: true
      scope module: :users do
        resources :posts, only: %i[index], shallow: true
      end
    end
    root to: "users#index"
  end
end
