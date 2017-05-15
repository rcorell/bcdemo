class Product < ApplicationRecord

  has_many :rate_plans

  validates :title,        length: { minimum: 1, maximum: 255 }
  validates :description,  length: { minimum: 1, maximum: 255 }

end
