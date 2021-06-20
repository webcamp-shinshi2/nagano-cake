class Address < ApplicationRecord
  belongs_to :customer

  # fomat以下郵便番号の正規表現
  # validates :postal_code, presence: true,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角数字のみで入力してください"}

  validates :address, presence: true
  validates :name, presence: true
end
