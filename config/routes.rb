Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    resources :posts, only: %i[new create]
    resources :users, only: :index do
      resources :relationships, only: %i[create destroy], shallow: true
      scope module: :users do
        resources :posts, only: %i[index show], shallow: true do
          resources :comments, only: %i[create destroy], shallow: true
          resources :likes, only: %i[create destroy], shallow: true
        end
      end
    end
    root to: "users#index"
  end
end
