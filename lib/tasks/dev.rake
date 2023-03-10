namespace :dev do
  desc "Configure developement enviroment"
  task setup: :environment do
    puts "Reseting DB"
    
    %x(rails db:drop db:create db:migrate)

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
        email:Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    
    puts "Contacts registered..."

    puts "Registering phones"

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Phones registered..."

    puts "Registering address"

    Contact.all.each do |contact|
      address = Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Address registered..."

  end
  
end
