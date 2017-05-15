class CreateProducts < ActiveRecord::Migration[5.1]

  def change
    create_table :products do |t|
      t.string    :title, default: '', nil: false
      t.string    :description, default: '', nil: false
      t.datetime  :start_date
      t.datetime  :end_date
      t.boolean   :discontinued, default: false, nil: false

      t.timestamps
    end
  end

end
