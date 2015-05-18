class DashboardController < ApplicationController
  def index
    @unprocessed_orders = Order.unprocessed
  end
end
