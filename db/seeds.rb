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
                password: "passward",
                password_confirmation: "passward",
                is_deleted: false,
                postal_code: "1234567",
                address: "東京都渋谷区代々木神園町0-0",
                phone_number: "09012345678",
                reset_password_token: "50",
                )