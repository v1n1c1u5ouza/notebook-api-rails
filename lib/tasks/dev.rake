namespace :dev do
  desc "Configure developement enviroment"
  task setup: :environment do
    puts "Registering kinds of content..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Kids of content registered"

    ###############################

    puts "Registering contact..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    
    puts "Contacts registered..."
  end
  
end
