class FechainicioAuction < ActiveRecord::Migration[5.1]
  def change
   
      add_column :auction1s, :fechainicio, :date
      
    
  end
end
