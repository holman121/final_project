class Clothing < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates :name,  presence: true
  validates :price, :quantity, numericality: true
end
