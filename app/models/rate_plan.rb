class RatePlan < ApplicationRecord

	belongs_to :product

	enum billing_frequency: [
		'One-Time',
		'Monthly',
		'Quarterly',
		'Annual'
	]

	validates :title,        			length: { minimum: 1, maximum: 255 }
	validates :description,  			length: { minimum: 1, maximum: 255 }
	validates :billing_frequency,	inclusion: { in: RatePlan.billing_frequencies.keys }

	monetize :price_in_cents, as: :price, numericality: { greater_than_or_equal_to: 0 }

	def retired?
		!end_date.nil? && end_date < Time.now
	end

end
