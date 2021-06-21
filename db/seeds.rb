# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(last_name: "紳士",
                first_name: "太郎",
                last_name_kana: "シンシ",
                first_name_kana: "タロウ",
                email: "test@test.com",
                password: "password",
                password_confirmation: "password",
                is_deleted: false,
                postal_code: "1234567",
                address: "東京都渋谷区代々木神園町0-0",
                phone_number: "09012345678",
                )

Admin.create!(email: "admin@test.com",
              password: "admintest",
              password_confirmation: "admintest"
              )

Genre.create!(name: "ケーキ")

Product.create!(name: "チーズケーキ",
                genre_id: 1,
                introduction: "濃厚なチーズケーキでおいしい",
                price: 500,
                is_sale: true,
                )

Product.create!(name: "ショートケーキ",
                genre_id: 1,
                introduction: "ショートケーキ",
                price: 500,
                is_sale: true,
                )

Address.create!(name: "淑女花子",
                  customer_id: 1,
                  address: "埼玉県三郷市〇〇町0-0",
                  postal_code: "3456789"
                  )

49.times do |n|
    gimei = Gimei.unique.name
    address = Gimei.unique.address

    last_name = gimei.last.kanji
    first_name = gimei.first.kanji
    last_name_kana = gimei.last.katakana
    first_name_kana = gimei.first.katakana

    email = "example-#{n+1}@example.com"
    password = "password"
    postal_code = rand(1000000..9999999).to_s
    phone_number = rand(1000000000..9999999999).to_s

    Customer.create!(
                    last_name:  last_name,
                    first_name: first_name,
                    last_name_kana: last_name_kana,
                    first_name_kana: first_name_kana,
                    email: email,
                    password: password,
                    password_confirmation: password,
                    is_deleted: false,
                    postal_code: postal_code,
                    address: address,
                    phone_number: phone_number
                    )
      end