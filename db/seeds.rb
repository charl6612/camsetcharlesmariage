# puts "delete"
# Presence.delete_all
# Song.delete_all
# Invite.delete_all
# Contact.delete_all
# User.delete_all
# puts "end of delete"


puts "import csv"

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = './lib/mariage - liste_full.csv'

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

  invit = Invite.new(
    first_name: "#{row['first_name']}",
    last_name: "#{row['last_name']}",
    temoin:"#{row['temoin']}",    
    allowedbefore:"#{row['allowedbefore']}",
    allowedrebond:"#{row['allowedrebond']}",
    child: "#{row['child']}",
    email: "#{row['email']}",
    user: user,
    )
    if invit.valid?
    invit.save
    puts "creating invit #{invit.first_name}"
    invit.presence = Presence.create
    end



end