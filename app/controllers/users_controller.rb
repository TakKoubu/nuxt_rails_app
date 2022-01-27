class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new
    # binding.pry
    if user.save
      render json: user
    else
      render json: user.errors, status: 422
    end
  end
  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end
end
