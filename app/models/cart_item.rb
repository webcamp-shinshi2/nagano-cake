class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :customer_id, :product_id, :amount, presence:true
  validates :amount, numericality: { greater_than_or_equal_to: 1}
end
