class Category < ApplicationRecord
  has_many :clothings
  has_many :accessories
  has_many :shoes

  validates :name, presence: true
end
