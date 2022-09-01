
class Api::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by_email(sign_in_params[:email])
    if user && user.valid_password?(sign_in_params[:password])
      @user = user
    else
      render json: { message: 'Invalid Credentials' }, status: :unprocessable_entity
    end
  end
end
