class CreateOwnerReportes < ActiveRecord::Migration[5.2]
  def change
    create_table :owner_reportes do |t|
      t.references :owner, index: true, foreign_key: true   
      t.references :comentario, index: true, foreign_key: true
      t.string "contenido"
      t.timestamps
    end
  end
end
