class Changeuserid < ActiveRecord::Migration[5.1]
  def change
    create_table :petitions do |t|
      t.integer :user_id
      t.timestamps
    end
   
  end
end
