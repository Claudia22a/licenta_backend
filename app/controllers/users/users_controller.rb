# app/controllers/users_controller.rb
class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def current
    render json: { user: current_user.as_json(only: [ :id, :email ]) }, status: :ok
  end
end
