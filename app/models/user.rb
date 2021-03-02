class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ZENKAKU_NAME = /\A[ぁ-んァ-ン一-龥]/
  ZENKAKU_NAME_KANA = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :family_name, format: { with: ZENKAKU_NAME }, allow_blank: true
  validates :family_name, presence: true
  validates :first_name, format: { with: ZENKAKU_NAME }, allow_blank: true
  validates :first_name, presence: true
  validates :family_name_kana, format: { with: ZENKAKU_NAME_KANA }, allow_blank: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, format: { with: ZENKAKU_NAME_KANA }, allow_blank: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true

end
