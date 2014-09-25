class LogsController < ApplicationController

  def index
  end

  def create
    @log = Log.new(log_params)
    @log.measurement_id = params[:log][:measurement_id]
    if @log.save
      redirect_to measurements_url
    else
      flash.now[:errors] = @log.errors.full_messages
      redirect_to edit_measurement_url(@log.measurement)
    end
  end

  def new
  end

  def destroy
    @log = Log.find(params[:id])
    flash.now[:alert] = 'Are you sure?'
    @log.destroy
    redirect_to edit_measurement_url(@log.measurement)
  end

  private
  def log_params
    params.require(:log).permit(:amount, :measurement_id)
  end
end
