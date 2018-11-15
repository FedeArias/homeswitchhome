class ParametrosInProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :descripcionLug, :text
    add_column :properties, :subastada, :boolean
    add_column :properties, :fecha, :date
    add_column :properties, :disponible, :boolean
  end
end
