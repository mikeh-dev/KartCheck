class Engine < ApplicationRecord
  belongs_to :user

  def self.search(engine_number)
    where(engine_number: engine_number)
  end
end
