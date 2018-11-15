class CreateAuction1s < ActiveRecord::Migration[5.1]
  def change
    create_table :auction1s do |t|
      t.string :nombre
      t.float :precio
      t.float :puja
      t.string :fecha

      t.timestamps
    end
  end
end
