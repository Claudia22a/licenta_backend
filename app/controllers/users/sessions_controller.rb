class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)
    render json: { user: resource.as_json(only: [ :id, :email ]), token: token }, status: :ok
  end

  def destroy
    if request.env["warden-jwt_auth.token"]
      Warden::JWTAuth::TokenRevoker.new.call(request.env["warden-jwt_auth.token"])
      render json: { message: "Logged out successfully" }, status: :ok
    else
      render json: { error: "No token provided" }, status: :unprocessable_entity
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: { user: resource.as_json(only: [ :id, :email ]), token: request.env["warden-jwt_auth.token"] }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
