# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin::Admin.create(email: 'hoangtheanhhp@gmail.com', 
                     password_digest: BCrypt::Password.create('123456'))

i = 0
@password = '123456'
until i > 10 #Until we've gone over 5
	User.create!(name: "liquick#{i}",
             email: "anhlahau.hl+#{i}@gmail.com",
             password: @password,
             password_confirmation: @password,
             phone: "090999999#{i}",
             address: "Hanoi, Vietnam",
             activated: true,
             activated_at: Time.zone.now)
             
	Partner.create!(name: "liquick_partner#{i}",
         email: "anhlahau.hl+#{i+11}@gmail.com",
         password: @password,
         password_confirmation: @password,
         phone: "090999999#{i+10}",
         address: "HoChiMinh, Vietnam",
         activated: true,
         activated_at: Time.zone.now,
         cost: 100*i)
    i = i+1
end #End the loop
