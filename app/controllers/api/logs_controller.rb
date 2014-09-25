class Api::LogsController < ApplicationController

  def index
  end

  def create
    @measurement = Measurement.find(params[:measurement_id])
    @log = @measurement.logs.new(log_params)
    if @log.save
      render "show"
    else
      render json: {}
    end
  end

  def new
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    head :ok
  end

  private
  def log_params
    params.require(:log).permit(:amount, :measurement_id)
  end
end
