class MeasurementsController < ApplicationController
  def new
    @current_measurements = Measurement.where("name != (?)", "weight")
  end

  def create
    @measurement = Measurement.new(measurement_params)

    if @measurement.save

    else

    end
  end

  def index
    @measurements = Measurement.where("name != (?)", "weight")
    @most_recent_weight = Log.where("measurement_id = (?)", "1").last
    @log = Log.new
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    @measurement.destroy
    redirect_to new_measurement_url
  end

  private
  def measurement_params
    params.require(:measurement).permit(:name)
  end
end
