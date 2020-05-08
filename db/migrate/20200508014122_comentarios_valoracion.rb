class ComentariosValoracion < ActiveRecord::Migration[5.2]
  def change
    add_column :comentarios, :valoracion, :float
  end
end
