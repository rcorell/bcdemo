class RatePlan < ApplicationRecord

  belongs_to :product

	enum TYPE = [
		'One-Time',
		'Monthly',
		'Quarterly',
		'Annual'
	]

  validates :title,        	length: { minimum: 1, maximum: 255 }
  validates :description,  	length: { minimum: 1, maximum: 255 }
  validates :type,					inclusion: { in: RatePlan::TYPES.keys }
  validates :cost_in_cents, numericality: { greater_than_or_equal_to: 0 }

end
