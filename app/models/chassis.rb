class Chassis < ApplicationRecord
  belongs_to :user

  validates :make, :model, :year, :colour, :number, presence: true

end
