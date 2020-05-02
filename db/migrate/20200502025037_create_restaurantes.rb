class CreateRestaurantes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurantes do |t|
      t.string :nombre
      t.string :descripcion
      t.float :valoracion

      t.timestamps
    end
  end
end
