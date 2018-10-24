class Review < ApplicationRecord
  belongs_to :trip
  validates :rating, :inclusion => { :in => 1..10}

end
