Rails.application.routes.draw do
  namespace 'api' do
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :memos, only: [:index, :create, :destroy]
    post "/login", to: "auth#login"
    get "/auto_login", to: "auth#auto_login"
  end
end
