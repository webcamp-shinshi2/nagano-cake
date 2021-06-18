class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :customer_id, :product_id, :amount, presence:true
end
