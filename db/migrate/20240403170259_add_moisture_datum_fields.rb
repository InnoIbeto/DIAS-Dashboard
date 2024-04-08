class AddMoistureDatumFields < ActiveRecord::Migration[7.1]
  def change
    create_table :moisture_data do |t|
      t.datetime :timestamp
      t.integer :moisture_level
      t.boolean :relay_state
      t.boolean :manual_override
      t.string :system_status

      t.timestamps
    end
  end
end