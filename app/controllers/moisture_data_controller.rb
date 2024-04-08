class MoistureDataController < ApplicationController
  before_action :authenticate_user!, unless: -> { request.format.json? }, except: [:create]
  
  def moisture_data_page
    @moisture_data = MoistureDatum.all.order(timestamp: :desc)
  end
    
  def create
    data = moisture_datum_params
    MoistureDatum.create!(
      timestamp: DateTime.strptime(data["timestamp"], "%d/%m/%Y:%H:%M:%S"),
      moisture_level: data["moisture_level"].to_i, 
      relay_state: data["relay_state"],
      manual_override: data["manual_override"],
      system_status: data["system_status"]
    )
    render json: { message: "Moisture data received successfully" }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def moisture_datum_params
    params.require(:moisture_datum).permit(:timestamp, :moisture_level, :relay_state, :manual_override, :system_status)
  end

end
