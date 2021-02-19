require 'rails_helper'

RSpec.describe 'Applicants show page' do
  before :each do
    @applicant_1 = Applicant.create!(name: "Harrison's Application", street: "123 ABC Street",
                    city: "Balitmore", state: "Maryland", zip: 21178, status:
                    "In Progress", description: "I need these pets because I'm so alone. Please I will pay anything just let me take home these guys today!")

    @dogs_and_cats = Shelter.create!(name: "Adopt Dogs", address: "956 Dog Street",
                                    city: "Denver", state: "Colorado", zip: 11032)
    @dogs_and_cats = Shelter.create!(name: "Little Cats", address: "401 Cat Street",
                                    city: "Miami", state: "Florida", zip: 17822)

    @beebo = @dogs_and_cats.pets.create!(name: "beebo", approximate_age: 2, sex: "male")
    @nimbis = @dogs_and_cats.pets.create!(name: "nimbis", approximate_age: 1, sex: "male")

    ApplicantPet.create!(applicant: @applicant_1, pet: @beebo)
    ApplicantPet.create!(applicant: @applicant_1, pet: @nimbis)
  end

  it "should display applicant information and links to their corresponding pets" do
    visit "applicants/#{@applicant_1.id}"

    expect(page).to have_content(@applicant_1.name)

    within(".address") do
      expect(page).to have_content(@applicant_1.street)
      expect(page).to have_content(@applicant_1.city)
      expect(page).to have_content(@applicant_1.state)
      expect(page).to have_content(@applicant_1.zip)
    end

    within(".pets") do
      expect(page).to have_content(@beebo.name)
      expect(page).to have_link("#{@beebo.name}", :href => "/pets/#{@beebo.id}")
      expect(page).to have_content(@nimbis.name)
      expect(page).to have_link("#{@nimbis.name}", :href => "/pets/#{@nimbis.id}")
    end

    within(".status") do
      expect(page).to have_content(@applicant_1.status)
    end

    within(".description") do
      expect(page).to have_content(@applicant_1.description)
    end
  end
end
