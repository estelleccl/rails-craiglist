# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative '../app/models/category'
require_relative '../app/models/post'

class CategoryImporter
  def self.import
    categories_list = ["job offered", "gig offered", "resume / job wanted", "housing offered", "housing wanted"]
    
    categories_list.each do |name|
      Category.create(name: name)
    end
  end
end

class PostImporter
  def self.import
    20.times do |x|
      Post.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph, 
        location: Faker::Address.street_name,
        postcode: Faker::Address.postcode,
        poster_name: Faker::Name.name,
        img_link: Faker::Internet.url,
        category_id: rand(1..Category.count),
        key: create_key
        )
    end
  end
end

def create_key(len=10)
  SecureRandom.hex(len)
end

CategoryImporter.import
PostImporter.import