class Address < ApplicationRecord
  belongs_to :customer

  # fomat以下郵便番号の正規表現
  # validates :postal_code, presence: true,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角数字のみで入力してください"}

  validates :address, :name, :postal_code, presence: true
  
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/ #正規表現を//で/正規表現/とサンドすることを忘れないよう
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }

end
