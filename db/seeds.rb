User.delete_all
Family.delete_all

puts 'Famille 1'

f = Family.create(
name:"Noppe"
)
puts f

puts 'creating user 1'

user = User.create(
  email: "charles@gmail.com",
  first_name: "charles",
  last_name: "noppe",
  password:"password",
  family: f,
)

puts 'creating user 2'

user = User.create(
  email: "camille@gmail.com",
  first_name: "camille",
  last_name: "delannoy",
  password:"password",
  family: f,
)