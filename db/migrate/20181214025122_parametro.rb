class Parametro < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :repetido, :integer
  end
end
