class About < ApplicationRecord
  validates :content, :contact,  presence: true
end
