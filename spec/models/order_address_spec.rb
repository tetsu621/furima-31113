require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    celler = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    @product = FactoryBot.create(:product, user_id: buyer.id)
    @order_address = FactoryBot.build(:order_address, product_id: @product.id, user_id: celler.id)
    sleep 1
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@order_address).to be_valid
  end


  it "tokenが空では登録できないこと" do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end

  it '郵便番号が空だと保存できないこと' do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it '都道府県が空だと保存できないこと' do
    @order_address.area_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Area is not a number")
  end

  it '市区町村が空だと保存できないこと' do
    @order_address.municipality = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
  end

  it "番地が空では登録できないこと" do
    @order_address.address = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end

  it "電話番号が空では登録できないこと" do
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
  end

  it "郵便番号にハイフンがないと登録できないこと" do
    @order_address.postal_code = 1234567
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Postal code is invalid")
  end

  it "電話番号にハイフンがあると登録できないこと" do
    @order_address.phone_number = "090-1234-5678"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end

  it "電話番号が12桁以上だと登録できないこと" do
    @order_address.phone_number = "090123456789"
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone number is invalid")
  end

end
