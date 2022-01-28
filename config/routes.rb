Rails.application.routes.draw do
  namespace 'api' do
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :memos, only: [:index, :create, :destroy]
  end
end
