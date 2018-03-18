class Customer < ApplicationRecord
  has_many :orders

  validates :full_name, :address, :email, :phone,  presence: true
end
