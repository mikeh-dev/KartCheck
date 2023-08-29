class Engine < ApplicationRecord
  belongs_to :user
  validates :make, :model, :engine_number, presence: true

  enum stolen_status: { stolen: true, not_stolen: false }

end
