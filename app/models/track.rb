class Track < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true
  validates :website, presence: true
  validates :length, presence: true
  validates :address, presence: true

  has_many_attached :images, dependent: :destroy

  def full_address
    
  end
end
