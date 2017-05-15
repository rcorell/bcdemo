class ChangeRatePlanTypeToEnum < ActiveRecord::Migration[5.1]

  def up
		change_column :rate_plan, :type, :integer, default: 0, nil: false
  end

	def down
		change_column :rate_plan, :type, :string
	end

end
