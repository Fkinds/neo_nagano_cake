class Address < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
end
