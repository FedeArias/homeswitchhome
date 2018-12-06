class Changeuserid < ActiveRecord::Migration[5.1]
  def change
    remove_column :petitions, :email
    add_column :petitions, :user_id, :integer 
  end
end
