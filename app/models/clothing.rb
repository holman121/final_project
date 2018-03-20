class Clothing < ApplicationRecord
  belongs_to :category
  belongs_to :sale
  mount_uploader :image, ImageUploader

  validates :name,  presence: true
  validates :price, :quantity, numericality: true

  paginates_per 5
end
