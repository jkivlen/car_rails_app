# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jim = User.create(username: "jim", email: "jim@yahoo.com", password: "password")
mike = User.creaet(username: "mike", email: "mike@yahoo.com", password: "password")

toyota = Make.create(name: "Toyota")
honda= Make.create(name: "Honda")
ford = Make.create(name: "Ford")

jim.cars.create(color: "red", price: 20000.00, four_wheel_drive: false, make_id: toyota.id)
jim.cars.create(color: "white", price: 16000.00, four_wheel_drive: false, make_id: honda.id)

mike.cars.create(color: "black", price: 40000.00, four_wheel_drive: true, make_id: ford.id)
mike.cars.create(color: "silver", price: 30000.00, four_wheel_drive: false, make_id honda.id)