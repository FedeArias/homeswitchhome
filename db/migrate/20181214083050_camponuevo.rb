class Camponuevo < ActiveRecord::Migration[5.1]
  def change
    add_column :hotsales, :repetido, :integer
  end
end
