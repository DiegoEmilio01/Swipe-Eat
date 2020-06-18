class AddOwnerToRestaurante < ActiveRecord::Migration[5.2]
  def change
    remove_reference :owners, :restaurante
    add_reference :restaurantes, :owners
  end
end
