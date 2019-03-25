require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    allInfo = {name: "Anything",
            description: "Lorem ipsum is something to describe",
            quantity: 20,
            image:'apparel3.jpg',
            price: 3000
          }
    @category = Category.new name: 'New Category'
    allInfo[:category] = @category
    @product = Product.new allInfo
  end


  describe 'Validations' do
    # validation tests/examples here

    context "given nothing" do
      it "should return false" do
        @product = Product.new
        expect(@product.save).to eql false
      end
    end

    context "Given everything" do
      it "should return true" do
        expect(@product.save).to eql true
      end
    end

    context "Missing name" do
      it "should return error" do
        @product[:name] = nil
        @product.save
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
    end


    context "Missing Price" do
      it "should return error" do
        @product[:price_cents] = nil
        @product.save
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
    end

    context "Missing Quantity" do
      it "should return error" do
        @product[:quantity] = nil
        @product.save
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
      end
    end

    context "Missing Category" do
      it "should return error" do
        @product.category = nil
        @product.save
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
    end

  end
end

# .errors.full_messages