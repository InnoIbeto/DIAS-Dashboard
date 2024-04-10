class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  
  def suggestions_page
    @npk_recommendation = calculate_npk_recommendation
    @moisture_recommendation = calculate_moisture_recommendation
  end

  private

  def calculate_npk_recommendation
    # Assuming npk_data contains the latest NPK data
    npk_data = NpkDatum.last
  
    # Sample optimal ranges for NPK levels
    optimal_ranges = {
      nitrogen: (5..10),
      phosphorous: (2..5),
      potassium: (5..10)
    }
  
    recommendations = {}
    optimal_ranges.each do |component, range|
      if npk_data.send(component) < range.min
        recommendations[component] = "Add more #{component.capitalize} fertilizer."
      elsif npk_data.send(component) > range.max
        recommendations[component] = "Reduce #{component.capitalize} fertilizer."
      end
    end
  
    recommendations["Adjust nutrient levels"] = "Adjusting nutrient levels ensures plants receive the right balance of essential elements for healthy growth. Imbalances can lead to deficiencies or toxicities, affecting plant development and yield."
  
    recommendations
  end
  
  

  def calculate_moisture_recommendation
    # Assuming moisture_data contains the latest moisture data
    moisture_data = MoistureDatum.last
  
    # Sample optimal moisture range
    optimal_range = (500..599)
  
    if moisture_data.moisture_level < optimal_range.min
      "Increase irrigation frequency or amount. Increasing irrigation frequency or amount helps prevent under or overwatering, ensuring plants receive adequate water without the risk of water stress or root damage."
    elsif moisture_data.moisture_level > optimal_range.max
      "Reduce irrigation frequency or amount. Reducing irrigation frequency or amount helps avoid waterlogging, which deprives roots of oxygen, leading to root death and a decline in plant vigor. Overwatering can also promote root rot and fungal diseases, harming plant health."
    else
      "Moisture level is optimal."
    end
  end
  
end
