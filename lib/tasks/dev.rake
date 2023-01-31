namespace :dev do
  desc "Configure developement enviroment"
  task setup: :environment do
    puts "Registering contact..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago)
      )
    end
    
    puts "Contacts registered..."
  end
  
end
