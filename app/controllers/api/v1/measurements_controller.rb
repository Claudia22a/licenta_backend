class Api::V1::MeasurementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_baby

  def create
    measurement = @baby.measurements.new(measurement_params)
    if measurement.save
      render json: measurement, status: :created
    else
      render json: { errors: measurement.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_baby
    @baby = current_user.babies.find(params[:baby_id])
  end

  def measurement_params
    params.require(:measurement).permit(:measured_at, :weight, :height, :head_circumference, :notes)
  end
end
