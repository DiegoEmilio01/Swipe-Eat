class RestaurantesQuitarValoracion < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurantes, :valoracion
  end
end
