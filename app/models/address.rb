class Address < ApplicationRecord
  belongs_to :customer

  validates :address, :name, :postal_code, presence: true
  validates :postal_code, presence: true, format: { with:  /\A\d{7}\z/ }

end
