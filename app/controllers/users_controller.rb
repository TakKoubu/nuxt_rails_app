class UsersController < ApplicationController
  def index
    # イベントデータの一覧を返す
    render json: User.all
  end
end
