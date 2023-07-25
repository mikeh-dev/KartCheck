class Engine < ApplicationRecord
  belongs_to :user

  validates :make, :model, :engine_number, presence: true
  
  include PgSearch::Model

  pg_search_scope :search_engine_number,
                  against: [:engine_number],
                  using: {
                    tsearch: { prefix: true }
                  }

end
