class Api::V1::LogEntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    baby = current_user.babies.find(params[:baby_id])
    logs = baby.log_entries.order(logged_at: :desc)

    if params[:type]
      logs = logs.where(entry_type: params[:type])
    end

    render json: logs
  end

  def create
    baby = current_user.babies.find(params[:baby_id])
    log = baby.log_entries.build(log_params)

    if log.save
      render json: log, status: :created
    else
      render json: { errors: log.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log_entry).permit(:entry_type, :logged_at, :notes, :duration, :amount, :unit,
                                      :location, :mood, :diaper_type, :feeding_type, :sleep_type,
                                      :walk_type, :symptom_type, :tag_type, :other_diaper_type,
                                      :other_feeding_type, :other_sleep_type, :other_walk_type,
                                      :other_symptom_type, :other_tag_type, :start_time, :end_time)
  end
end
