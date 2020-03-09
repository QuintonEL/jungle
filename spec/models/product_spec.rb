require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid" do
      @product = Product.new
      @category = Category.new
      @category.name = "testCat"
      @product.name = "test"
      @product.price_cents = 123123
      @product.quantity = 4
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it "is not valid without a name" do
      @product = Product.new(name: nil)
      @product.valid?
      expect(@product.errors[:name]).to include ("can't be blank")
    end

    it "is valid with a name" do
      @product = Product.new(name: "test")
      @product.valid?
      expect(@product.errors[:name]).not_to include ("can't be blank")
    end

    it "is not valid without a price" do
      @product = Product.new(price_cents: nil)
      @product.valid?
      expect(@product.errors[:price_cents]).to include ("is not a number")
    end

    it "is valid with a price" do
      @product = Product.new(price_cents: 123123)
      @product.valid?
      expect(@product.errors[:price_cents]).not_to include ("is not a number")
    end

    it "is not valid without a quantity" do
      @product = Product.new(quantity: nil)
      @product.valid?
      expect(@product.errors[:quantity]).to include ("can't be blank")
    end

    it "is valid with a quantity" do
      @product = Product.new(quantity: 4)
      @product.valid?
      expect(@product.errors[:quantity]).not_to include ("can't be blank")
    end

    it "is not valid without a category" do
      @category = Category.new
      @product = Product.new(category: nil)
      @product.valid?
      expect(@product.errors[:category]).to include ("can't be blank")
    end

    it "is valid with a category" do
      @category = Category.new
      @product = Product.new(category: @category)
      @product.valid?
      expect(@product.errors[:category]).not_to include ("can't be blank")
    end
  end
end
