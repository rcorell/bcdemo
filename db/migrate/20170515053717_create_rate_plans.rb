class CreateRatePlans < ActiveRecord::Migration[5.1]

  def change
    create_table :rate_plans do |t|
      t.string      :title, default: '', nil: false
      t.string      :description, default: '', nil: false
      t.string      :type # One-time, Monthly, Quarterly, Annually
      t.integer     :price_in_cents
      t.datetime    :start_date
      t.datetime    :end_date
      t.belongs_to  :product, index: true

      t.timestamps
    end
  end

end
