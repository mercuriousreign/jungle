class Admin::DashboardController < ApplicationController
  
  
  def show
    @product_count = Product.all.count
    #@category_count = Product.distinct.count('category_id')
    @category_counts = Category.all.count
  
  end
end
