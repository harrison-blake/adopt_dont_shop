require 'rails_helper'

RSpec.describe ApplicantPet do
  describe "relationships" do
    it {should belong_to :pet}
    it {should belong_to :applicant}
  end
end
