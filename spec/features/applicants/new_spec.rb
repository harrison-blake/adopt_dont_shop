require 'rails_helper'

RSpec.describe 'New Applicant' do
  describe 'As a visitor' do
    describe 'When I visit the new applicant form' do
      it 'I can create a new applicant' do
        visit '/pets'

        click_link 'Start an Application'

        expect(current_path).to eq('/applicants/new')

        fill_in 'name', with: 'laurence'
        fill_in "street", with: "145 Front Street"
        fill_in "city", with: "Baltimore"
        fill_in "state", with: "Maryland"
        fill_in "zip", with: 23909
        fill_in "description", with: "I would be an awsome owner"
        click_on "Create Application"

        expect(page).to have_content('laurence')
      end

      it 'I cannot create an applicant without all infomation' do
        visit '/applicants/new'

        click_on 'Create Application'

        expect(page).to have_content("Application not created: Required information missing.")
        expect(page).to have_button('Create Application')
      end
    end
  end
end
