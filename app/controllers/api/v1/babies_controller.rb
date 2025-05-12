class Api::V1::BabiesController < ApplicationController
  before_action :authenticate_user!

  def index
    babies = current_user.babies
    render json: babies
  end

  def create
    baby = current_user.babies.build(baby_params)
    if baby.save
      render json: baby, status: :created
    else
      render json: { errors: baby.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/babies/:id
  def update
  baby = current_user.babies.find(params[:id])
  if baby.update(baby_params)
    render json: baby
  else
    render json: { errors: baby.errors.full_messages }, status: :unprocessable_entity
  end
  end

  private

  def baby_params
    params.require(:baby).permit(
      :name, :birth_date, :gender, :weight_at_birth,
      :height_at_birth, :blood_type, :allergies, :notes
    )
  end
end
