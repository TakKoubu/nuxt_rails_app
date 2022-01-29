module Api
  class AuthController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        payload = {user_id: user.id,email: user.email}
        token = encode_token(payload)
        render json: {jwt: token,success: "Welcome back, #{user.email}"}
      else
        response_unauthorized
      end
    end

    def auto_login
      if session_user 
        render json: session_user
      else
        render json: {errors: "No user Logged In"}
      end
    end
  end
end
