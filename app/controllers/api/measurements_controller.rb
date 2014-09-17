class Api::MeasurementsController < ApplicationController
  def new
    @additional_measurements = Measurement.where("measurements.name != ? AND measurements.user_id = ?", "weight", current_user.id)
  end

  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.user_id = current_user.id
    @additional_measurements = Measurement.where("name != ? AND user_id = ?", "weight", current_user.id)

    if @measurement.save
      flash[:success] = "Measurement added."
      redirect_to new_measurement_url
    else
      flash.now[:errors] = @measurement.errors.full_messages
      render :new
    end
  end
  
  def edit
    @measurements = Measurement.where("user_id = ?", current_user.id)
    @measurement = Measurement.find(params[:id])
  end
  
  def update
    @measurement = Measurement.find(params[:id])
    if @measurement.save
      redirect_to edit_measurement_url(params[:measurement][:id])
    end
  end

  def index
    @weight_measurement = current_user.measurements.first
    @additional_measurements = Measurement.where("name != ? AND user_id = ?", "weight", current_user.id)
    @most_recent_weight = @weight_measurement.logs.last
    @log = Log.new
    render "index"
  end

  def destroy
    @measurement = Measurement.find(params[:id])
    @measurement.destroy
    redirect_to new_measurement_url
  end

  def all
  end

  private
  def measurement_params
    params.require(:measurement).permit(:name, :unit)
  end
end
