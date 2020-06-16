class OwnerAgregarNombre < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :nombre, :string, :default => "Pendiente"
  end
end
