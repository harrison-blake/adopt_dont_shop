class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :applicant_pets
  has_many :applicants, through: :applicant_pets
  validates_presence_of :name, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]
end
