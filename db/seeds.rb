# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "建立默认种子用户"
  # User.create(email:"1@1.com",password:"123456",password_confirmation:"123456",is_admin:true)
puts "建立默认jobs"
for i in 1..10 do
  Job.create(title:"No#{i}",description:"这是关于No#{i}的介绍",wage_upper_bound: rand(50..99)*100,
              wage_lower_bound:rand(10..50)*50,is_hidden:"false",contact_email:"11e")
end
puts "？"
