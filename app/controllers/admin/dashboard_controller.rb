class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_SECRET_NAME'], password: ENV['ADMIN_SECRET_PASSWORD']

  
  def show
  end
end
