class AddRestauranteToMeets < ActiveRecord::Migration[5.2]
  def change
    add_reference :meets, :restaurante
  end
end
