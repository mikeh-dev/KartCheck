class Engine < ApplicationRecord
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["engine_number"]
  end

end
