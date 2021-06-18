class Order < ApplicationRecord
  belongs_to :customer
  


  enum payment_method: {"クレジットカード": 0, "銀行振込": 1 }



  validates :postal_code,  presence: true,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :address, presence: true
  validates :name, presence: true

end
