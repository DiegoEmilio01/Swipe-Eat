class CreateMensajes < ActiveRecord::Migration[5.2]
  def change
    create_table :mensajes do |t|
      t.integer "swiper_origen"
      t.integer "swiper_destino"
      t.string "contenido"
      
      t.timestamps
    end
  end
end
