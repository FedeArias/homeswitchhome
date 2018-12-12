class AddCredits < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :creditos, :integer, default: 2
  end
end
