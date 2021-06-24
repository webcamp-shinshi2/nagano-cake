class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer


  enum payment_method: {"クレジットカード": 0, "銀行振込": 1 }
  enum status: {"入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  validates :postal_code,  presence: true
  validates :address, presence: true
  validates :name, presence: true
  
  def change_making_status
    if self.status == "入金待ち"
      self.order_details.update(making_status: :着手不可)
    elsif self.status == "入金確認"
      self.order_details.update(making_status: :制作待ち)
    end
  end

end
