class Category < ApplicationRecord
  has_many :clothings
  has_many :accessories
  has_many :shoes
end
