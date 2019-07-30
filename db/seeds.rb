Presence.delete_all
Invite.delete_all
User.delete_all

puts 'creating user 1'

user1 = User.create(
  email: "charles@gmail.com",
  password:"password"
)

puts 'creating invite'
invit = Invite.create(
  email: "camille@gmail.com",
  first_name: "camille",
  last_name: "delannoy",
  allowedbefore: true,
  temoin: false,
  user: user1,
)

puts invit.valid?

invit2 = Invite.create(
  email: "gaspard@gmail.com",
  first_name: "gaspard",
  last_name: "delannoy",
  allowedbefore: false,
  temoin: false,
  user: user1,
)
puts invit2.valid?


# require 'csv'

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath    = '/home/charles/code/charl6612/camsetcharlesmariage/db/mariage - invite_avant.csv'

# CSV.foreach(filepath, csv_options) do |row|

#   user = User.create(
#     email: "#{row['email']}",
#     first_name: "#{row['first_name']}",
#     last_name: "#{row['last_name']}",
#     password:"#{row['password']}",
#     temoin:"#{row['temoin']}",    
#     allowedbefore:"#{row['allowedbefore']}",
#     family: f,
#   )
# end


