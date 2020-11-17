require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new({ name: 'test'})
      @product_params = { name: 'test-prod', price: 10000, quantity: 15 }
    end
    context "given all required values are present and valid" do
      it "successfully saves" do
        expect(@category.products.new(@product_params))
          .to be_valid
      end
    end
    context "given a missing" do
      context "name param" do
        it "fails to save" do
          expect(@category.products.new(@product_params.except(:name)))
            .not_to be_valid
        end
      end
      context "price param" do
        it "fails to save" do
          expect(@category.products.new(@product_params.except(:price)))
            .not_to be_valid
        end
      end
      context "quantity param" do
        it "fails to save" do
          expect(@category.products.new(@product_params.except(:quantity)))
            .not_to be_valid
        end
      end
      context "category" do
        it "fails to save" do
          expect(Product.new(@product_params))
          .not_to be_valid
        end
      end
    end
  end
end
