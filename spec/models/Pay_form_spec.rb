require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @pay_form = FactoryBot.build(:pay_form)
  end

  describe '発送先住所登録' do
    context '住所登録できるとき' do
      it '発送先住所の情報全てが存在すれば登録できる' do
        expect(@pay_form).to be_valid
      end

      it 'postal_codeがハイフンありの数値であれば登録できる' do
        @pay_form.postal_code = '111-1111'
        expect(@pay_form).to be_valid
      end

      it 'prefecture_idが1以外であれば登録できる' do
        @pay_form.prefecture_id = 8
        expect(@pay_form).to be_valid
      end

      it 'cityが存在すれば登録できる' do
        @pay_form.city = '川崎市'
        expect(@pay_form).to be_valid
      end

      it 'street_addressが存在すれば登録できる' do
        @pay_form.street_address = '苅宿23-1'
        expect(@pay_form).to be_valid
      end

      it 'bulding_nameが空でも登録できる' do
        @pay_form.bulding_name = nil
        expect(@pay_form).to be_valid
      end

      it 'phone_numberが11桁以内の数値であれば登録できる' do
        @pay_form.phone_number = '08067899876'
        expect(@pay_form).to be_valid
      end
    end

    context '住所登録できないとき' do
      it 'postal_codeが空では登録できない' do
        @pay_form.postal_code = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @pay_form.postal_code = '1234567'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが1だと登録できない' do
        @pay_form.prefecture_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では登録できない' do
        @pay_form.city = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("City can't be blank")
      end

     it 'street_addressが空では登録できない' do
      @pay_form.street_address= nil
      @pay_form.valid?
      expect(@pay_form.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @pay_form.phone_number = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数値以外では登録できない' do
        @pay_form.phone_number = 'ああ１２３あああ２３４'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが英数混合では登録できない' do
        @pay_form.phone_number = '080abcd1234'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では登録できない' do
        @pay_form.token = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが無い場合は購入できないこと" do
        @pay_form.user_id = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが無い場合は購入できないこと" do
        @pay_form.item_id =nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
