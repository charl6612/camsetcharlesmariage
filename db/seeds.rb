Presence.delete_all
Invite.delete_all
User.delete_all

# puts 'creating charles'

# user1 = User.create(
#   email: "charles@gmail.com",
#   password:"password"
# )

# puts 'creating camille'
# invit = Invite.create(
#   email: "camille@gmail.com",
#   first_name: "camille",
#   last_name: "delannoy",
#   allowedbefore: true,
#   temoin: false,
#   user: user1,
# )

# presence = Presence.new(
# )
# presence.invite = invit
# presence.save

puts "import csv"

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = '/home/charles/code/charl6612/camsetcharlesmariage/db/mariage - liste_full.csv'

CSV.foreach(filepath, csv_options) do |row|

  if   !User.find_by(email: "#{row['emailcompte']}")

    puts "creating user #{row['emailcompte']}"
    user = User.create(
    email: "#{row['emailcompte']}",
    password:"#{row['mdp']}",
    )

  else
    user = User.find_by(email: "#{row['emailcompte']}")
  end
  puts "creating invite #{row['first_name']}"

invit = Invite.create(
  first_name: "#{row['first_name']}",
  last_name: "#{row['last_name']}",
  temoin:"#{row['temoin']}",    
  allowedbefore:"#{row['allowedbefore']}",
  child: "#{row['child']}",
  email: "#{row['email']}",
  user: user,
)

presence = Presence.new(
)
presence.invite = invit
presence.save


end


