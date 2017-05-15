class ChangeRatePlanTypeToBillingFrequency < ActiveRecord::Migration[5.1]

  def change
    rename_column :rate_plans, :type, :billing_frequency
  end

  def down
    rename_column :rate_plans, :billing_frequency, :type
  end

end
