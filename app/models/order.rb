class Order < ApplicationRecord
  enum payment_method: {"クレジットカード": 0, "銀行振込": 1 }

end
