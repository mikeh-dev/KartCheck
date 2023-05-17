class Track < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true

  def self.can_create_track?(user)
    user&.admin?
  end
  
end
