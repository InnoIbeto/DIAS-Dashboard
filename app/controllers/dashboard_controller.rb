class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard_page
    @npk_data = NpkDatum.all.order(timestamp: :desc)
    @moisture_data = MoistureDatum.all.order(timestamp: :desc)
    # p @moisture_data
  end
end
