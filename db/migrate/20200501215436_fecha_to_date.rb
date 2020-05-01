class FechaToDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :comentarios, :fecha
    add_column :comentarios, :fecha, :timestamp
  end
end
