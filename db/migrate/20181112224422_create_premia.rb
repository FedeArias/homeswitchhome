class CreatePremia < ActiveRecord::Migration[5.1]
  def change
    create_table :premia do |t|
      t.string :User

      t.timestamps
    end
  end
end
