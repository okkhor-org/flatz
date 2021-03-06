class Api::V1::AuthController < ApplicationController

  def show
    if decoded_token.empty?
      render json: {valid: false}
    else
      render json: {valid: true}
    end
  end

  def create
    user = User.find_or_create_by(email: params[:email])

    if user
      render json: {
        email: user.email,
        jwt: JWT.encode({user_id: user.id}, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
      },
      status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy

  end
end
