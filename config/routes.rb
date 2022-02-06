Rails.application.routes.draw do
  namespace 'api' do
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :likes
        get :likers
      end
    end
    resources :memos, only: [:index, :create]
    post "/login", to: "auth#login"
    get "/auto_login", to: "auth#auto_login"

    resources :goodwills, only: [:create, :destroy]
  end
end
