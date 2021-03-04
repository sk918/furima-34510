class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_cost
  belongs_to :delivery_period
  belongs_to :prefecture
  belongs_to :status
  has_one_attached :image
  belongs_to :user
  has_one :purchased_item

  validates :price, format: { with: /\A[0-9]+\z/ }, allow_blank: true, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 } 
  validates :title, length: { maximum: 40}
  validates :description, length: { maximum: 1000}

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_period_id
    validates :price
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_cost_id
    validates :delivery_period_id
    validates :prefecture_id
    validates :status_id
  end
  
end
