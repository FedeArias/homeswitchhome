class CreateHotsales < ActiveRecord::Migration[5.1]
  def change
    create_table :hotsales do |t|
      t.string :nombre
      t.float :precio
      t.float :preciohot
      t.date :fecha
      t.integer :property_id

      t.timestamps
    end
  end
end
