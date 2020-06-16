class AddingAceptadoToRestaurante < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :aceptado, :string, :default => "Pendiente"
  end
end
