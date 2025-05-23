class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource, store: false)
    token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
    render json: { user: resource.as_json(only: [ :id, :email ]), token: token }, status: :ok
  end

  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render json: { message: "Logged out successfully" }, status: :ok
  end

  private

  def respond_with(resource, _opts = {})
    render json: { user: resource.as_json(only: [ :id, :email ]), token: request.env["warden-jwt_auth.token"] }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
