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
             
  VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
end
