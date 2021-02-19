class Applicant < ApplicationRecord
  has_many :applicant_pets
  has_many :pets, through: :applicant_pets
  validates :name, :street, :city, :state, :zip, :description, presence: true
end
