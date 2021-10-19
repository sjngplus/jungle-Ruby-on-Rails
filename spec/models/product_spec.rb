require 'rails_helper'
require 'pp'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'Saves new product into db with all fields' do
      test_category = Category.create name: "Testing"
      test_product = test_category.products.create ({
        name:  'Test Product',
        description: "Test product description goes here",
        quantity: 5,
        price: 99.00        
      })      
      expect(Product.all.first).to have_attributes(name: 'Test Product', description: "Test product description goes here", quantity: 5, price: 99.00)
    end

    it 'Throws an error if no name is entered' do
      test_category = Category.create name: "Testing"
      test_product = test_category.products.create ({
        description: "Test product description goes here",
        quantity: 5,
        price: 99.00        
      })
      expect(test_product.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'Throws an error if no price is entered' do
      test_category = Category.create name: "Testing"
      test_product = test_category.products.create ({
        name:  'Test Product',
        description: "Test product description goes here",
        quantity: 5                
      })
      expect(test_product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end

    it 'Throws an error if no quantity is entered' do
      test_category = Category.create name: "Testing"
      test_product = test_category.products.create ({
        name:  'Test Product',
        description: "Test product description goes here",        
        price: 99.00        
      })
      expect(test_product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    it 'Throws an error if no category is entered' do
      test_category = Category.create name: "Testing"
      test_product = Product.create ({
        name:  'Test Product',
        description: "Test product description goes here",
        quantity: 5,
        price: 99.00        
      })
      expect(test_product.errors.full_messages).to eq ["Category can't be blank"]
    end

  end
  
end
