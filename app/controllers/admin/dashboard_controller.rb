class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']
  def show
    @all_products = {}
    @all_products[:count] = Product.count(:all)
    @all_products[:avg_price] = Product.average(:price_cents)
    @all_products[:avg_quantity] = Product.average(:quantity)
    @all_products[:total_stock_value] = Product.where(quantity: 0...Float::INFINITY).select('SUM(price_cents * quantity) AS stock_value')[0][:stock_value]
    
    @category_details = {}
    @category_details[:count] = Category.count(:all)
    @category_details[:avg_products] = @all_products[:count] / @category_details[:count]
    
  end
end
