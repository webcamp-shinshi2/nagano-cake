class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
   validates :address, :first_name, :last_name, 
             :first_name_kana, :last_name_kana, 
             :postal_code, :phone_number, 
             presence: true

  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
       validates :first_name_kana
       validates :last_name_kana
     end

end
