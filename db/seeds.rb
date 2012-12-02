# This seed will be used when uploaded to the Heroku server (use terminal command: heroku hun hake db:seed)

# Will delete all tables below
Client.destroy_all
Starter.destroy_all
Project.destroy_all
Offer.destroy_all
Skill.destroy_all


#   Will create list of Skills. 
skills = [ "Ruby On Rails", "HTML + CSS", "User Experience" ]

skills.each do |skill|
  Skill.create name: skill
end

puts "#{Skill.count} skills are now in the database."



projects = [ {:client_id => '1', :description => 'First test.', :name => 'Testing'} ]
projects.each do |project|
	p = Project.new
	p.client_id = project[:client_id]
	p.description = project[:description]
	p.name = project[:name]
	p.save
end

#   Will create list of Clients.
Client.create(:first_name => "client1", :last_name => "client1", :email => "client1@client1.com", :password => "client1", :password_confirmation => "client1")
Client.create(:first_name => "client2", :last_name => "client2", :email => "client2@client2.com", :password => "client2", :password_confirmation => "client2")

puts "#{Client.count} clients are now in the database."


#   Will create list of Starters. 
Starter.create(:first_name => "starter1", :last_name => "starter1", :email => "starter1@starter1.com", :password => "starter1", :password_confirmation => "starter1")
Starter.create(:first_name => "starter2", :last_name => "starter2", :email => "starter2@starter2.com", :password => "starter2", :password_confirmation => "starter2")

puts "#{Starter.count} starters are now in the database."


