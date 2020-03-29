require 'rails_helper'

describe Item do
  describe '#create' do

    # item_nameがなければ登録できない
    it "is invalid without a item_name" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("を入力してください")
    end

    # priceがなければ登録できない
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # discriptionがなければ登録できない
    it "is invalid without a discription" do
      item = build(:item, discription: nil)
      item.valid?
      expect(item.errors[:discription]).to include("を入力してください")
    end

    # sizeがなければ登録できない
    it "is invalid without a size" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end

    # statusがなければ登録できない
    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    # delivery_chargeがなければ登録できない
    it "is invalid without a delivery_charge" do
      item = build(:item, delivery_charge: nil)
      item.valid?
      expect(item.errors[:delivery_charge]).to include("を入力してください")
    end

    # areaがなければ登録できない
    it "is invalid without a area" do
      item = build(:item, area: nil)
      item.valid?
      expect(item.errors[:area]).to include("を入力してください")
    end

    # shipping_dateがなければ登録できない
    it "is invalid without a shipping_date" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("を入力してください")
    end

    # shipping_methodがなければ登録できない
    it "is invalid without a shipping_method" do
      item = build(:item, shipping_method: nil)
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end













  end
end




