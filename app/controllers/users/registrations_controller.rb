class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in(resource_name, resource, store: false)
      token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
      render json: { user: resource.as_json(only: [ :id, :email ]), token: token }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { user: resource.as_json(only: [ :id, :email ]), token: request.env["warden-jwt_auth.token"] || Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil) }, status: :ok
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
