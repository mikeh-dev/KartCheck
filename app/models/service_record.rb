class ServiceRecord < ApplicationRecord
  belongs_to :engine
  has_one_attached :attachment, service: :amazon
end
