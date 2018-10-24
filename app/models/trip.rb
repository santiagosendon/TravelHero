class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_one :review

  def city_name
    city.name
  end 
end
