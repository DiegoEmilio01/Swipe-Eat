class DropTableMensajes < ActiveRecord::Migration[5.2]
  def change
    drop_table :mensajes
    create_table :mensajes do |t|
      t.integer "swiper_origen_id", :null => false
      t.integer "swiper_destino_id", :null => false
      t.string "contenido"
      
      t.timestamps
    end
  end
end
