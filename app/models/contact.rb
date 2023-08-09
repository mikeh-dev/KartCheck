class Contact < ApplicationRecord
  validates :first_name, :last_name, :phone_number, :email, :message, presence: true
end