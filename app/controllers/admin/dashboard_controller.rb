class Admin::DashboardController < ApplicationController
  
  
  def show
    @product_count = Product.all.count
    @category_counts = Category.all.count
  
  end
end
