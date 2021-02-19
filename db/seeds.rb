# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Applicant.destroy_all
Pet.destroy_all
Shelter.destroy_all

applicant_1 = Applicant.create!(name: "Harrison's Application", street: "123 ABC Street",
                city: "Balitmore", state: "Maryland", zip: 21178, status:
                "In Progress", description: "I need these pets because I'm so alone.
                Please I will pay anything just let me take home these guys today!")

dogs_and_cats = Shelter.create!(name: "Adopt Dogs", address: "956 Dog Street",
                                city: "Denver", state: "Colorado", zip: 11032)
dogs_and_cats = Shelter.create!(name: "Little Cats", address: "401 Cat Street",
                                city: "Miami", state: "Florida", zip: 17822)

beebo = dogs_and_cats.pets.create!(name: "beebo", approximate_age: 2, sex: "male")
nimbis = dogs_and_cats.pets.create!(name: "nimbis", approximate_age: 1, sex: "male")

ApplicantPet.create!(applicant: applicant_1, pet: beebo)
ApplicantPet.create!(applicant: applicant_1, pet: nimbis)
