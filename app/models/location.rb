class Location < ApplicationRecord
  
  validates :city,  presence: true
  validates :state, presence: true
  
end
