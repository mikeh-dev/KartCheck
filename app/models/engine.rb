class Engine < ApplicationRecord
  belongs_to :user

  validates :make, :model, :engine_number, presence: true

  enum stolen_status: { stolen: true, not_stolen: false }
  
  include PgSearch::Model

  pg_search_scope :search_engine_number,
                  against: [:engine_number],
                  using: {
                    tsearch: { prefix: true }
                  }

end
