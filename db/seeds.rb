# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'

chez_boris = { name: 'Chez Boris', address: '123 Main St', category: 'french' }
peking_express = { name: 'Peking Express', address: '456 Elm St', category: 'chinese' }
positano = { name: 'Positano', address: '789 Oak St', category: 'italian' }
burger_and_fries = { name: 'Burger and Fries', address: '101 Pine St', category: 'belgian' }
yatai_ramen = { name: 'Yatai Ramen', address: '202 Maple St', category: 'japanese' }

[chez_boris, peking_express, positano, burger_and_fries, yatai_ramen].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts 'Finished!'
