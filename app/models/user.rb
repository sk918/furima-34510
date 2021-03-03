class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ZENKAKU_NAME = /\A[ぁ-んァ-ン一-龥々]+\z/
  ZENKAKU_NAME_KANA = /\A[ァ-ヶー－]+\z/

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birth_date
  end

  with_options format: { with: ZENKAKU_NAME }, allow_blank: true do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: ZENKAKU_NAME_KANA }, allow_blank: true do
    validates :family_name_kana
    validates :first_name_kana
  end
end
