class Address < ApplicationRecord
  belongs_to :customer

  validates :address, :name, :postal_code, presence: true

  # VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/ #正規表現を//で/正規表現/とサンドすることを忘れないよう
  validates :postal_code, presence: true, format: { with:  /\A\d{7}\z/ }

end
