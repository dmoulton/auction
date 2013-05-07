# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Item.create( name: 'Quilt',
             description: "Quilt by Flossie Moulton",
             image_url: 'http://www.themoultonbarn.com/wp-content/uploads/2013/04/photo1.jpg',
             min_bid: 100.00,
             min_increment: 20.00)

Item.create( name: 'Briefcase',
             description: "Briefcase by Dan Moulton",
             image_url: 'http://placehold.it/250&text=Briefcase',
             min_bid: 100.00,
             min_increment: 20.00)
