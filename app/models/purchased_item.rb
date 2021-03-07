class PurchasedItem < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :bulding_name, :phone_number, :purchased_item_id

  belongs_to :user
  belongs_to :item
  has_one :delivery_addresses

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }, allow_blank: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/}, allow_blank: true
  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :phone_number
  end

  def save
purchased_item = PurchasedItem.create(user_id: user_id, item_id: item_id)
DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchased_item_id: purchased_item.id)
end

end
