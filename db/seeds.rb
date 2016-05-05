# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# c1 = Category.create(id: 1, name: 'arduino', description: 'arduino_description')
# c2 = Category.create(id: 2, name: 'raspberry', description: 'raspberry_description')
# c3 = Category.create(id: 3, name: 'python', description: 'python_description')
# c4 = Category.create(id: 4, name: 'android', description: 'android_description')
# c5 = Category.create(id: 5, name: 'drones', description: 'drone_description')

OrderStatus.delete_all
OrderStatus.create! id: 1, name: 'In Progress'
OrderStatus.create! id: 2, name: 'Placed'
OrderStatus.create! id: 3, name: 'Shipped'
OrderStatus.create! id: 4, name: 'Cancelled'