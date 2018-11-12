class CreateRegistreds < ActiveRecord::Migration[5.1]
  def change
    create_table :registreds do |t|
      t.string :User

      t.timestamps
    end
  end
end
