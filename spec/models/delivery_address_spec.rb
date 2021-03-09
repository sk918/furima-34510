require 'rails_helper'

RSpec.describe DeliveryAddress, type: :model do
  before do
    @delivery_address = FactoryBot.build(:delivery_address)
  end

  describe '発送先住所登録' do
    context '住所登録できるとき' do
      it '発送先住所の情報全てが存在すれば登録できる' do
        expect(@delivery_address
        ).to be_valid
      end

      it 'postal_codeがハイフンありの数値であれば登録できる' do
        @delivery_address.postal_code = '111-1111'
        expect(@delivery_address).to be_valid
      end

      it 'prefecture_idが1以外であれば登録できる' do
        @delivery_address.prefecture_id = 8
        expect(@delivery_address).to be_valid
      end

      it 'cityが存在すれば登録できる' do
        @delivery_address.city = '川崎市'
        expect(@delivery_address).to be_valid
      end

      it 'street_addressが存在すれば登録できる' do
        @delivery_address.street_address = '苅宿23-1'
        expect(@delivery_address).to be_valid
      end

      it 'bulding_nameが空でも登録できる' do
        @delivery_address.bulding_name = nil
        expect(@delivery_address).to be_valid
      end

      it 'phone_numberが11桁以内の数値であれば登録できる' do
        @delivery_address.phone_number = '08067899876'
        expect(@delivery_address).to be_valid
      end
    end

    context '住所登録できないとき' do
      it 'postal_codeが空では登録できない' do
        @delivery_address.postal_code = nil
        @delivery_address.valid?
        expect(@delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @delivery_address.postal_code = '1234567'
        @delivery_address.valid?
        expect(@delivery_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが1だと登録できない' do
        @delivery_address.prefecture_id = 1
        @delivery_address.valid?
        expect(@delivery_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では登録できない' do
        @delivery_address.city = nil
        @delivery_address.valid?
        expect(@delivery_address.errors.full_messages).to include("City can't be blank")
      end

     it 'street_addressが空では登録できない' do
      @delivery_address.street_address= nil
      @delivery_address.valid?
      expect(@delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @delivery_address.phone_number = nil
        @delivery_address.valid?
        expect(@delivery_address.errors.full_messages).to include("Phone number code can't be blank")
      end

      it 'phone_numberが数値以外では登録できない' do
        @delivery_address.phone_number = 'ああ１２３あああ２３４'
        @delivery_address.valid?
        expect(@delivery_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
