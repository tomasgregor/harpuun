#   Will create list of Skills. This seed will be used when uploaded to the Heroku server (use terminal command: heroku hun hake db:seed)
Skill.destroy_all

skills = [ "Ruby On Rails", "HTML + CSS", "User Experience" ]

skills.each do |skill|
  Skill.create name: skill
end

puts "#{Skill.count} skills are now in the database."


