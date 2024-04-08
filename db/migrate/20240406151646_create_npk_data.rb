class CreateNpkData < ActiveRecord::Migration[7.1]
  def change
    create_table :npk_data do |t|
      t.datetime :timestamp
      t.integer :nitrogen
      t.integer :phosphorous
      t.integer :potassium

      t.timestamps
    end
  end
end
