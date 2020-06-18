class AddOwnerToRestauranteDos < ActiveRecord::Migration[5.2]
  def change
    remove_reference :restaurantes, :owners
    add_reference :restaurantes, :owner
  end
end
