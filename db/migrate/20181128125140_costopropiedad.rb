class Costopropiedad < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :precio, :integer
  end
end
