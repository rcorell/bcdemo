class ChangeRatePlanTypeToEnum < ActiveRecord::Migration[5.1]

  def up
		change_column :rate_plans, :type, :integer, default: 0, nil: false
  end

	def down
		change_column :rate_plans, :type, :string
	end

end
