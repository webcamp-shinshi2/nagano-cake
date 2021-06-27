class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  
  enum making_status: {"製作不可": 0, "製作待ち":1 , "製作中": 2, "製作完了": 3 }
  
  
   # order_statusの変更
  def change_order_status
    if self.making_status == "製作中"
      self.order.update(status: "製作中")
    elsif OrderDetail.where(order_id: self.order_id).pluck(:making_status).all?{ |making_status| making_status == "製作完了" }
      self.order.update(status: "発送準備中")
    end
  end
  
end
