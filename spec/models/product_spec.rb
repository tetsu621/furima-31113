require 'rails_helper'
  
RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    describe '商品出品' do
      context '新規登録がうまくいくとき' do
        it "全てを満たしている場合は出品できる" do
          expect(@product).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "imageが空だと登録ができない" do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end

        it "titleが空だと登録ができない" do
          @product.title = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Title can't be blank")
        end

        it "explanationが空だと登録ができない" do
          @product.explanation = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Explanation can't be blank")
        end

        it "category_idが空だと登録ができない" do
          @product.category_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Category can't be blank")
        end

        it "status_idが空だと登録ができない" do
          @product.status_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Status can't be blank")
        end
    
        it "delivery_fee_idが空だと登録ができない" do
          @product.delivery_fee_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery fee can't be blank")
        end

        it "area_idが空だと登録ができない" do
          @product.area_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Area can't be blank")
        end
    
        it "day_idが空だと登録ができない" do
          @product.day_id = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Day can't be blank")
        end

        it "priceが空だと登録ができない" do
          @product.price = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが半角数字出ないと登録ができない" do
          @product.price = "１２３４５"
          @product.valid?
          expect(@product.errors.full_messages).to include("Price 半角数字を使用してください")
        end
    
        it "priceが300以下だと登録ができない" do
          @product.price = 299
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not included in the list")
        end

        it "priceが9999999以上だと登録ができない" do
          @product.price = 10000000
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is not included in the list")
        end

        it "category_idが1だと登録ができない" do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category must be other than 1")
        end

        it "status_idが1だと登録ができない" do
          @product.status_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Status must be other than 1")
        end

        it "delivery_fee_idが1だと登録ができない" do
          @product.delivery_fee_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Delivery fee must be other than 1")
        end

        it "area_idが1だと登録ができない" do
          @product.area_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Area must be other than 1")
        end

        it "day_idが1だと登録ができない" do
          @product.day_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Day must be other than 1")
        end
      end
    end
  end
end
