# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

url = "http://www.recipepuppy.com/api/"
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)['results']

puts pp(data)

Recipe.destroy_all

data.each do |recipe|
    Recipe.create(title: recipe['title'],
                  href: recipe['href'])
end

