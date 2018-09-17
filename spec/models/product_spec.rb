require 'rails_helper'

RSpec.describe Product, type: :model do

  before do 

  end 
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe 'Validations' do 
    
    category = Category.new(name: "Electronics")
    category.save! 
    product = Product.new(name: 'Product Name', price_cents: 2300, quantity: 42, category_id: category.id)


    it "is valid with all the proper data" do
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product.name = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product.name = "Product Name"
      product.price_cents = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      product.price = 2300
      product.quantity = nil 
      expect(product).to_not be_valid
    end


    it "is not valid without a category" do
      product.quantity = 42      
      product.category = nil
      expect(product).to_not be_valid
    end

  end

end
