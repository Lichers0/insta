Rails.application.routes.draw do
  devise_for :users

  scope module: :web do
    get 'users/index'
    root to: 'users#index'
  end

end
