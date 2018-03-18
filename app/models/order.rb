class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :size

  validates :product_name,  presence: true
  validates :total_price, :quantity, numericality: true
end
