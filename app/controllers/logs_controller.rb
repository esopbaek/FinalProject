class LogsController < ApplicationController

  def index

  end

  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id
    if @log.save
      redirect_to measurements_url
    else
      flash.now[:errors] = @log.errors.full_messages
    end
  end

  def new
  end

  def destroy
    @log = Log.find(params[:id])
  end

  private
  def log_params
    params.require(:log).permit(:unit, :measurement_id)
  end
end
