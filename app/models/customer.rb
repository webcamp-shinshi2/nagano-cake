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
  
  VALID_LAST_NAME_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :last_name_kana, presence: true, format: { with: VALID_LAST_NAME_KANA_REGEX ,}
  
  
  VALID_FIRST_NAME_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_FIRST_NAME_KANA_REGEX }

end
