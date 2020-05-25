class CreateTableCitas < ActiveRecord::Migration[5.2]
  def change
    drop_table (:citas, if_exists: true)
    
    create_table :citas do |t|
      t.integer "swiper_cita_id", :null => false
      t.integer "swiper_citado_id", :null => false
      t.timestamp "fecha"
      t.boolean "estado"

      t.timestamps
    end
  end
end
