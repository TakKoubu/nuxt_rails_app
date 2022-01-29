module Api
  class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def show
      render json: User.find(params[:id])
    end

    def create
      user = User.new(user_params)
      if user.save
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user.id, jwt: token}
      else
        render json: {errors: user.errors.full_messages},status: :not_acceptable
      end
    end

    def update
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: user.errors, status: 422
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy!
      render json: user
    end

    private

    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation)
    end
  end
end
