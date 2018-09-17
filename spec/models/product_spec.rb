require 'rails_helper'

RSpec.describe Product, type: :model do

  before do 

  end 
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe 'Validations' do 
    
    category = Category.new(name: "Electronics")
    category.save! 
    product = Product.new(name: 'Product Name', price: 2300, quantity: 42, category_id: category.id)


    it "is valid with all the proper data" do
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product.name = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product.price = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      product.quantity = nil 
      expect(product).to_not be_valid
    end


    it "is not valid without a category" do
      product.category = nil
      expect(product).to_not be_valid
    end

  end

end
