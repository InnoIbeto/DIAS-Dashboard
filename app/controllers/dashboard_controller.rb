class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard_page
  end
end
