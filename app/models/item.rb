class Item < ApplicationRecord

  validates :price, format { with: /\A[0-9]+\z/ }, 
                             allow_blank: true,
                             numericality: { only_integer: true, greater_than: 299, less_than: 10,000,000}
  validates :title, length { maximum: 40}
  validates :description, length { maximum: 1000}

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
end
