class Accessory < ApplicationRecord
  belongs_to :category
  validates :name,  presence: true
  validates :price, :quantity, numericality: true
end
