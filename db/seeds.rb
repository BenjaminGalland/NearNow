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
marseille = User.create(username: "marseille", email: "marseille@gmail.com", password: "azerty", age: 2700, location: "Marseille", description: "La plus belle ville du monde")
puts "Create dylane user"
dylane = User.create(username: "dylane", email: "dylane@gmail.com", password: "azerty", age: 27, location: "Marseille", description: "")
puts "Create t0t0 user"
t0t0 = User.create(username: "t0t0", email: "t0t0@gmail.com", password: "azerty", age: 29, location: "", description: "Antoine et Théo m'ont séquestré pendant si longtemps, maintenant à moi la liberté !")
puts "Create ddiieeggooo user"
diego = User.create(username: "diego", email: "diego@gmail.com", password: "azerty", age: 32, location: "", description: "Vous avez combien de bitcoins vous ?")
puts "Create titi"
titi = User.create(username: "titi", email: "titi@gmail.com", password: "azerty", age: 8, location: "", description: "J'ai pas beaucoup d'amis mais ils sont gentils")


puts "Create tags --------------"
technologie = Tag.create(name: "Technologie")
culturel = Tag.create(name: "Culturel")
bowling = Tag.create(name: "Bowling")
loisirs = Tag.create(name: "Loisirs")
sport = Tag.create(name: "Sport")
famille = Tag.create(name: "Famille")
divers = Tag.create(name: "Divers")
nourriture = Tag.create(name: "Nourriture")
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
  address: "Rue de l'Observance 13001 Marseille",
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
  address: "Rue Robert Marseille",
  description: "Exposition personnelle de l'artiste Alexandre IMBERT « Des Lieux et des Sentiments ».",
  public: false,
  max_people: 7,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event4.name, event_id: event4.id)
chatroom.save

EventTag.create(event_id: event4.id, tag_id: culturel.id)

5.times do
  Participant.create(user_id: toto.id, event_id: event4.id)
end

participant = Participant.new(user_id: marseille.id, event_id: event4.id)
participant.save
puts "#{event4.name} created!"

event5 = Event.create(
  name: "Conférence Ruby on Rails",
  start_date: DateTime.new(2023,12,23,14,00),
  end_date: DateTime.new(2023,12,23,23,00),
  address: "Rue des dominicaines 13001 Marseille",
  description: "Présentée par Myriam Graïne au Palais de la Bourse.",
  public: false,
  max_people: 20,
  user_id: marseille.id
  )
chatroom = Chatroom.new(name: event5.name, event_id: event5.id)
chatroom.save

EventTag.create(event_id: event5.id, tag_id: technologie.id)
EventTag.create(event_id: event5.id, tag_id: famille.id)

16.times do
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
  description: "C'est pour Loris. Ramenez des cookies et des muffins svp",
  public: false,
  max_people: 20,
  user_id: dylane.id
  )
chatroom = Chatroom.new(name: event7.name, event_id: event7.id)
chatroom.save

EventTag.create(event_id: event7.id, tag_id: solidaire.id)

participant = Participant.new(user_id: dylane.id, event_id: event7.id)
participant.save
puts "#{event7.name} created!"


event8 = Event.create(
  name: "Bowling de Noel",
  start_date: DateTime.new(2023,12,24,18,00),
  end_date: DateTime.new(2023,12,24,23,00),
  address: "Rue Roux de Brignoles Marseille",
  description: "Petit bowling pour tous ceux qui n'ont rien à faire le 24 au soir les copains !",
  public: false,
  max_people: 6,
  user_id: titi.id
  )
chatroom = Chatroom.new(name: event8.name, event_id: event8.id)
chatroom.save

EventTag.create(event_id: event8.id, tag_id: bowling.id)

participant = Participant.new(user_id: titi.id, event_id: event8.id)
participant.save
puts "#{event8.name} created!"

event9 = Event.create(
  name: "Anniv  de Diego",
  start_date: DateTime.new(2023,12,23,18,00),
  end_date: DateTime.new(2023,12,23,23,00),
  address: "l'Orée des pins Sanary sur Mer",
  description: "Offrez-moi des bitcoins par pitié",
  public: false,
  max_people: 15,
  user_id: diego.id
  )
chatroom = Chatroom.new(name: event9.name, event_id: event9.id)
chatroom.save

EventTag.create(event_id: event9.id, tag_id: famille.id)
EventTag.create(event_id: event9.id, tag_id: technologie.id)

participant = Participant.new(user_id: diego.id, event_id: event9.id)
participant.save

11.times do
  Participant.create(user_id: toto.id, event_id: event9.id)
end
puts "#{event9.name} created!"


event10 = Event.create(
  name: "Feu d'artifice",
  start_date: DateTime.new(2023,12,23,18,00),
  end_date: DateTime.new(2023,12,23,23,00),
  address: "Portissol Sanary-sur-Mer",
  description: "Ca va être trop beau !",
  public: true,
  max_people: 15,
  user_id: toto.id
  )
chatroom = Chatroom.new(name: event10.name, event_id: event10.id)
chatroom.save

EventTag.create(event_id: event10.id, tag_id: famille.id)
EventTag.create(event_id: event10.id, tag_id: spectacle.id)
EventTag.create(event_id: event10.id, tag_id: divers.id)

participant = Participant.new(user_id: toto.id, event_id: event10.id)
participant.save

52.times do
  Participant.create(user_id: toto.id, event_id: event10.id)
end
puts "#{event10.name} created!"
