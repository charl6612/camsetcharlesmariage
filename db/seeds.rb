Presence.delete_all
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

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = '/home/charles/code/charl6612/camsetcharlesmariage/db/mariage - invite_avant.csv'

CSV.foreach(filepath, csv_options) do |row|

  user = User.create(
    email: "#{row['email']}",
    first_name: "#{row['first_name']}",
    last_name: "#{row['last_name']}",
    password:"#{row['password']}",
    temoin:"#{row['temoin']}",    
    allowedbefore:"#{row['allowedbefore']}",
    family: f,
  )
end


