class Chassis < ApplicationRecord
  belongs_to :user
  validates :make, :model, :year, :colour, :number, presence: true
  enum stolen: { stolen: true, not_stolen: false }
end
