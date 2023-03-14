require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.create(name: "test category")
    @product = Product.create(name: "test name",description:"bla bla",category: @category, quantity: 60, price: 2000)
    @product.save
    
  end

  describe 'Validations' do
    it 'Should have all the coloumns' do
      expect(@product.name).to be_present
      expect(@product.category_id).to be_present
      expect(@product.quantity).to be_present
      expect(@product.price).to be_present
    end

    it "Should have a name" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "Should have a category" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "Should have a quantity" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end

    it "Should have a price" do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
    end




  end
end
