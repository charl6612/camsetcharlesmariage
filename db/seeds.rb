Presence.delete_all
Song.delete_all
Invite.delete_all
Contact.delete_all
User.delete_all


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
  puts "creating invite #{row['first_name']}"

invit = Invite.create(
  first_name: "#{row['first_name']}",
  last_name: "#{row['last_name']}",
  temoin:"#{row['temoin']}",    
  allowedbefore:"#{row['allowedbefore']}",
  allowedrebond:"#{row['allowedrebond']}",
  child: "#{row['child']}",
  email: "#{row['email']}",
  user: user,
)

presence = Presence.new(
)
presence.invite = invit
presence.save
end

#send mail to everybody
User.all.each do |user|
UserMailer.welcome_email(user).deliver_now
end
