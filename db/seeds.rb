# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data (except skills)
puts "Clearing existing data..."
TeamMembership.destroy_all
UserSkill.destroy_all
Team.destroy_all
User.destroy_all

puts "Creating users..."

# Create coach
coach = User.create!(
  first_name: "Adrien",
  last_name: "Régis",
  email: "adrien.regis@gmail.com",
  password: "azerty",
  password_confirmation: "azerty"
)

puts "Created coach: #{coach.full_name}"

# Create players
players_data = [
  { first_name: "Gil", last_name: "Dupont", email: "gil.dupont@example.com" },
  { first_name: "Kalvin", last_name: "Martin", email: "kalvin.martin@example.com" },
  { first_name: "Loic", last_name: "Bernard", email: "loic.bernard@example.com" },
  { first_name: "Raphael", last_name: "Petit", email: "raphael.petit@example.com" },
  { first_name: "Keryan", last_name: "Robert", email: "keryan.robert@example.com" },
  { first_name: "Liham", last_name: "Richard", email: "liham.richard@example.com" },
  { first_name: "Derek", last_name: "Durand", email: "derek.durand@example.com" },
  { first_name: "Aaron", last_name: "Leroy", email: "aaron.leroy@example.com" },
  { first_name: "Adam", last_name: "Moreau", email: "adam.moreau@example.com" }
]

players = []
players_data.each do |player_data|
  player = User.create!(
    first_name: player_data[:first_name],
    last_name: player_data[:last_name],
    email: player_data[:email],
    password: "azerty",
    password_confirmation: "azerty"
  )
  players << player
  puts "Created player: #{player.full_name}"
end

puts "Creating team..."

# Create team
team = Team.create!(
  name: "U13 A",
  category: "U13",
  description: "Équipe U13 entraînée par Adrien Régis, qui évolue en D1 cette année"
)

puts "Created team: #{team.name}"

puts "Creating team memberships..."

# Add coach to team
TeamMembership.create!(
  user: coach,
  team: team,
  role: "coach"
)

puts "Added coach to team"

# Add players to team
players.each do |player|
  TeamMembership.create!(
    user: player,
    team: team,
    role: "player"
  )
  puts "Added player #{player.full_name} to team"
end

puts "Creating skills..."

# Load skills seed
load(Rails.root.join('db', 'seeds', 'skills_seed.rb'))

puts "Seed completed successfully!"
puts "Coach login: adrien.regis@gmail.com / azerty"
puts "Player logins: [first_name].[last_name]@example.com / azerty"
