class Product < ApplicationRecord

    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    
    attachment :image
    
    def price
      (self.price * 1.10).round
    end
    
end
