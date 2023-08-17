class Engine < ApplicationRecord
  belongs_to :user
  has_many :service_records
  validates :make, :model, :engine_number, presence: true

  enum stolen_status: { stolen: true, not_stolen: false }
  
  include PgSearch::Model
  pg_search_scope :search_engine_number,
                  against: [:engine_number],
                  using: {
                    tsearch: { prefix: true }
                  }
end
