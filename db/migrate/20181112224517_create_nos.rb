class CreateNos < ActiveRecord::Migration[5.1]
  def change
    create_table :nos do |t|
      t.string :registred
      t.string :User

      t.timestamps
    end
  end
end
