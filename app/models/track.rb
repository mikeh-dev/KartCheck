class Track < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  validates :overview, :phone, :address, :website, :email, :opening_time, :closing_time, :length, presence: true

  has_many_attached :images, dependent: :destroy

end
