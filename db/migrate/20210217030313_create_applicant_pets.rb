class CreateApplicantPets < ActiveRecord::Migration[5.2]
  def change
    create_table :applicant_pets do |t|
      t.references :applicant
      t.references :pet

      t.timestamps
    end
  end
end
