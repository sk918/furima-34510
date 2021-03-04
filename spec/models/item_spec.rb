require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

   describe '商品出品' do
    context '商品出品できるとき' do
      it '商品出品情報全てが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'titleがあれば登録できる' do
        @item.title = '商品名'
        expect(@item).to be_valid
      end

      it 'descriptionがあれば登録できる' do
        @item.description = '商品に説明'
        expect(@item).to be_valid
      end

      it 'category_idが1以外であれば登録できる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end

      it 'status_idが1以外であれば登録できる' do
        @item.status_id = '2'
        expect(@item).to be_valid
      end

      it 'delivery_cost_idが1以外であれば登録できる' do
        @item.delivery_cost_id = '2'
        expect(@item).to be_valid
      end

      it 'prefecture_idが1以外であれば登録できる' do
        @item.prefecture_id = '2'
        expect(@item).to be_valid
      end

      it 'delivery_period_idが1以外であれば登録できる' do
        @item.delivery_period_id = '2'
        expect(@item).to be_valid
      end

      it 'priceが半角数字かつ¥300~¥9,999,999であれば登録できる' do
        @item.delivery_period_id = '300'
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'catedory_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが1だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'delivery_cost_idが1だと登録できない' do
        @item.delivery_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'delivery_period_idが1だと登録できない' do
        @item.delivery_period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period must be other than 1")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥299以下の場合登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it 'priceが¥10,000,000以上の場合登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end

