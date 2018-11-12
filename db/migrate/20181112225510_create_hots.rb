class CreateHots < ActiveRecord::Migration[5.1]
  def change
    create_table :hots do |t|
      t.string :sale
      t.integer :precio
      t.string :fecha
      t.propiedad :propiedad

      t.timestamps
    end
  end
end
