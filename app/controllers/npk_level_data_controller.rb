class NpkLevelDataController < ApplicationController
  before_action :authenticate_user!, unless: -> { request.format.json? }, except: [:create]
  
  def NPK_level_data_page
    @npk_data = NpkDatum.all.order(timestamp: :desc)
  end

  def create
    data = npk_datum_params
    NpkDatum.create!(
      timestamp: DateTime.strptime(data["timestamp"], "%d/%m/%Y:%H:%M:%S"),
      nitrogen: data["nitrogen"].to_i, 
      phosphorous: data["phosphorous"].to_i,
      potassium: data["potassium"].to_i
    )
    render json: { message: "NPK data received successfully" }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def npk_datum_params
    params.require(:npk_level_datum).permit(:timestamp, :nitrogen, :phosphorous, :potassium)
  end
end
