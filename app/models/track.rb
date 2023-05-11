class Track < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  validates :overview, :phone, :address, :website, :email, :opening_time, :closing_time, :length, presence: true

  has_one_attached :main_image, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  def full_address
    [address].compact.join(', ')
  end

end
