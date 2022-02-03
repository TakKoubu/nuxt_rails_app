Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  namespace 'api' do
    resources :users, only: [:index, :show, :create, :update, :destroy] do
      member do
        get :likes
        get :likers
      end
    end
    resources :memos, only: [:index, :create, :destroy]
    post "/login", to: "auth#login"
    get "/auto_login", to: "auth#auto_login"

    resources :favorites, only: [:create, :destroy]
  end
end
