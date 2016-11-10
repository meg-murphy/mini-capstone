# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "The Cashmerre Crop Mockneck", price: "130", image: "https://everlane-2.imgix.net/i/34d07gfd_4531.jpg?w=1200&h=1200&q=65&dpr=1", description: "A slightly oversized cashmere mockneck with a relaxed but playful cropped cut.")
product.save
product = Product.new(name: "The Belted Wool Shawl Coat", price: "250", image: "https://everlane-2.imgix.net/i/909bfa9e_70f2.jpg?w=1200&h=1200&q=65&dpr=1", description: "A beautiful double-faced wool coat with an elongated silhouette that will keep you warm.")
product.save
product = Product.new(name: "The Heeled Oxford", price: "180", image: "https://everlane.imgix.net/i/2a426541_1199.jpg?w=1200&h=1200&q=65&dpr=1", description: "A sleek Italian leather Oxford with a comfortable, wide heel.")
product.save
