class Api::MeasurementsController < ApplicationController
  def new
  end

  def create
    @measurement = current_user.measurements.new(measurement_params)
    if @measurement.save
      render "show"
    else
      render json: {}
    end
  end
  
  def edit
    @measurement = Measurement.find(params[:id])
    render "show"
  end
  
  def update
    @measurement = Measurement.find(params[:id])
    if @measurement.update_attributes
      render "show"
    end
  end

  def index
    @measurements = current_user.measurements
    render "index"
  end
  
  def show
    @measurement = Measurement.find(params[:id])
    render "show"
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    @measurement.destroy
    head :ok
  end


  private
  def measurement_params
    params.require(:measurement).permit(:name, :unit)
  end
end
