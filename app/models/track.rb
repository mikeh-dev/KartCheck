class Track < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many_attached :images, dependent: :destroy

  def full_address
    
  end
end
