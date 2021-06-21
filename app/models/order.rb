class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details


  enum payment_method: {"クレジットカード": 0, "銀行振込": 1 }



  validates :postal_code,  presence: true
  validates :address, presence: true
  validates :name, presence: true

end
