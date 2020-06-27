class AddDataToRestaurante < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :direccion, :string
    add_column :restaurantes, :telefono, :string
  end
end
