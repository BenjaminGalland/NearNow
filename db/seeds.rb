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
Event.destroy_all
Tag.destroy_all
User.destroy_all

puts "Create users ---------------"
puts "Create tal user"
tal = User.create(username: "tal", email: "tal@gmail.com", password: "azerty", age: 29, location: "Sanary-sur-mer", description: "Porteur du projet NearNow. Fan de snow et de basket.")
puts "Create toto user"
toto = User.create(username: "toto", email: "toto@gmail.com", password: "azerty", age: 29, location: "Marseille", description: "Juste un curieux qui passait par là.")
puts "Create lewagon user"
lewagon = User.create(username: "lewagon", email: "lewagon@gmail.com", password: "azerty", age: 29, location: "Marseille", description: "")
puts "Create marseille user"
marseille = User.create(username: "marseille", email: "marseille@gmail.com", password: "azerty", age: 2700, location: "Marseille", description: "")
puts "Create dylane user"
dylane = User.create(username: "dylane", email: "dylane@gmail.com", password: "azerty", age: 27, location: "Marseille", description: "")

puts "Create tags --------------"
technologie = Tag.create(name: "Technologie")
sport = Tag.create(name: "Sport")
culturel = Tag.create(name: "Culturel")
famille = Tag.create(name: "Famille")
environnement = Tag.create(name: "Environnement")
musique = Tag.create(name: "Musique")
cinema = Tag.create(name: "Cinéma")
spectacle = Tag.create(name: "Spectacle")
militant = Tag.create(name: "Militant")
solidaire = Tag.create(name: "Solidaire")



puts "Create events --------------"
event1 = Event.create(
  name: "DemoDay au Wagon",
  start_date: DateTime.new(2023,12,22,15,30),
  end_date: DateTime.new(2023,12,22,18,00),
  address: "21 rue Haxo Marseille",
  description: "Découvre les projets finaux de nos étudiants!",
  public: true,
  max_people: 0,
  user_id: lewagon.id
  )
chatroom = Chatroom.new(name: event1.name, event_id: event1.id)
chatroom.save

EventTag.create(event_id: event1.id, tag_id: technologie.id)

Participant.create(user_id: lewagon.id, event_id: event1.id) #le créateur de l'event
50.times do
  Participant.create(user_id: toto.id, event_id: event1.id)
end
puts "#{event1.name} created!"

event2 = Event.create(
  name: "Soirée Candlelight",
  start_date: DateTime.new(2023,12,22,18,15),
  end_date: DateTime.new(2023,12,22,23,00),
  address: "20 Bd Madeleine Rémusat, 13013 Marseille",
  description: "Assister à la magie des concerts Candlelight entouré par des milliers de bougies.",
  public: true,
  max_people: 0,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event2.name, event_id: event2.id)
chatroom.save

EventTag.create(event_id: event2.id, tag_id: culturel.id)
EventTag.create(event_id: event2.id, tag_id: musique.id)

37.times do
  Participant.create(user_id: toto.id, event_id: event2.id)
end

participant = Participant.new(user_id: marseille.id, event_id: event2.id)
participant.save
puts "#{event2.name} created!"

event3 = Event.create(
  name: "Marché de Noël",
  start_date: DateTime.new(2023,12,22,18,15),
  end_date: DateTime.new(2023,12,25,23,00),
  address: "Place du Général-de-Gaulle 13001 Marseille",
  description: "Les cabanons de Noël sont de retours !",
  public: true,
  max_people: 0,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event3.name, event_id: event3.id)
chatroom.save

EventTag.create(event_id: event3.id, tag_id: culturel.id)
EventTag.create(event_id: event3.id, tag_id: famille.id)

43.times do
  Participant.create(user_id: toto.id, event_id: event3.id)
end

participant = Participant.new(user_id: marseille.id, event_id: event3.id)
participant.save
puts "#{event3.name} created!"

event4 = Event.create(
  name: "Sortie MUCEM",
  start_date: DateTime.new(2023,12,22,14,00),
  end_date: DateTime.new(2023,12,22,23,00),
  address: "22 rue lulli Marseille",
  description: "Exposition personnelle de l'artiste Alexandre IMBERT « Des Lieux et des Sentiments ».",
  public: true,
  max_people: 0,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event4.name, event_id: event4.id)
chatroom.save

EventTag.create(event_id: event4.id, tag_id: culturel.id)

11.times do
  Participant.create(user_id: toto.id, event_id: event4.id)
end

participant = Participant.new(user_id: marseille.id, event_id: event4.id)
participant.save
puts "#{event4.name} created!"

event5 = Event.create(
  name: "Conférence Ruby on Rails",
  start_date: DateTime.new(2023,12,23,14,00),
  end_date: DateTime.new(2023,12,23,23,00),
  address: "9 La Canebière 13001 Marseille",
  description: "Présentée par Myriam Graïne au Palais de la Bourse.",
  public: true,
  max_people: 0,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event5.name, event_id: event5.id)
chatroom.save

EventTag.create(event_id: event5.id, tag_id: technologie.id)
EventTag.create(event_id: event5.id, tag_id: famille.id)

26.times do
  Participant.create(user_id: toto.id, event_id: event5.id)
end

participant = Participant.new(user_id: marseille.id, event_id: event5.id)
participant.save
puts "#{event5.name} created!"

event6 = Event.create(
  name: "Manifestation des TA du Wagon",
  start_date: DateTime.new(2023,12,23,14,00),
  end_date: DateTime.new(2023,12,23,23,00),
  address: "Quai des Belges 13001 Marseille",
  description: "Pour une hausse des salaires et une revalorisation de la profession. Rejoignez le mouvement !",
  public: true,
  max_people: 0,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event6.name, event_id: event6.id)
chatroom.save

EventTag.create(event_id: event6.id, tag_id: militant.id)

26.times do
  Participant.create(user_id: toto.id, event_id: event6.id)
end

participant = Participant.new(user_id: marseille.id, event_id: event6.id)
participant.save
puts "#{event6.name} created!"

event7 = Event.create(
  name: "Collecte alimentaire",
  start_date: DateTime.new(2023,12,15,18,00),
  end_date: DateTime.new(2023,12,15,23,00),
  address: "Rue Francis Davso 13001 Marseille",
  description: "Organisée par Dylane pour son collègue Loris. Ramenez des cookies et des muffins svp",
  public: false,
  max_people: 0,
  user_id: dylane.id
  )
chatroom = Chatroom.new(name: event7.name, event_id: event7.id)
chatroom.save

EventTag.create(event_id: event7.id, tag_id: solidaire.id)

participant = Participant.new(user_id: dylane.id, event_id: event7.id)
participant.save
puts "#{event7.name} created!"
