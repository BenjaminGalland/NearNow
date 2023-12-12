# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clear database"
Tag.destroy_all
Event.destroy_all
User.destroy_all

puts "Create users ---------------"
puts "Create tal user"
tal = User.create(username: "tal", email: "tal@gmail.com", password: "azerty", age: 29, location: "Sanary-sur-mer", description: "Porteur du projet NearNow. Fan de snow et de basket.")
puts "Create toto user"
toto = User.create(username: "toto", email: "toto@gmail.com", password: "azerty", age: 29, location: "Marseille", description: "Juste un curieux qui passait par là.")

puts "Create tags --------------"
tag1 = Tag.create(name: "Sport")
tag2 = Tag.create(name: "Culturel")
tag3 = Tag.create(name: "Technologie")


puts "Create events --------------"
event1 = Event.create(
  name: "Soirée spéciale au Wagon",
  start_date: DateTime.new(2023,12,12,18,15),
  end_date: DateTime.new(2023,12,12,23,00),
  address: "21 rue Haxo Marseille",
  description: "Venez nombreux!",
  public: true,
  max_people: 0,
  user_id: tal.id
  )
participant = Participant.new(user_id: tal.id, event_id: event1.id)
participant.save
puts "#{event1.name} created!"
