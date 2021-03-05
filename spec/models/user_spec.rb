require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー登録情報全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'family_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.family_name = '亜あア'
        expect(@user).to be_valid
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '亜あア'
        expect(@user).to be_valid
      end

      it 'family_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.family_name_kana = 'アアア'
        expect(@user).to be_valid
      end

      it 'first_name_kanaが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'アアア'
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上かつ半角英数字混合であれば登録できること' do
        @user.password = 'aiu123'
        @user.password_confirmation = 'aiu123'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordとpassword_confirmationが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

     it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'aiu123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailには@がない場合登録できない' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが半角英数字混合でも5文字以下であれば登録できない' do
        @user.password = 'aiu12'
        @user.password_confirmation = 'aiu12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英語のみでは登録できない' do
        @user.password = 'zaqwsx'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '987654'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = '1k４sk３s'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが半角英数字混合でも不一致では登録できない' do
        @user.password = 'aiu123'
        @user.password_confirmation = 'aiu1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが半角であれば登録できない' do
        @user.family_name = 'aｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'first_nameが半角であれば登録できない' do
        @user.first_name = 'aｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'family_name_kanaが半角であれば登録できない' do
        @user.family_name_kana = 'aｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'first_name_kanaが半角であれば登録できない' do
        @user.first_name_kana = 'aｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
    end
  end
end
