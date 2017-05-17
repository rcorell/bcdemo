class Product < ApplicationRecord

  has_many :rate_plans

  validates :title,        length: { minimum: 1, maximum: 255 }
  validates :description,  length: { minimum: 1, maximum: 255 }
	validates_presence_of :start_date, :end_date
	validates :end_date, date: { after_or_equal_to: :start_date, message: 'must be after start date' }


  def retired?
    rate_plans.each do |rate_plan|
      return false if rate_plan.start_date && rate_plan.start_date < Time.now && rate_plan.end_date && rate_plan.end_date > Time.now
    end

    true
  end

end
