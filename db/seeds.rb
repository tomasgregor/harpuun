#   Will create list of Skills. This seed will be used when uploaded to the Heroku server (use terminal command: heroku hun hake db:seed)
Skill.destroy_all

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
