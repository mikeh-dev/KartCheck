class User < ApplicationRecord
has_person_name
has_many :chassis
has_many :engines

extend FriendlyId
friendly_id :name, use: :slugged

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end