class TablasRelaciones < ActiveRecord::Migration[5.2]
  def change
    drop_table :swipers_acepta

    add_reference :swipers, :comuna, foreign_key: true
    add_reference :restaurantes, :comuna, foreign_key: true
    add_reference :comentarios, :owner, foreign_key: true
    add_reference :owners, :restaurante, foreign_key: true

    create_table :aceptados, :force => true, :id => false do |t|
      t.integer "swiper_acepta_id", :null => false
      t.integer "swiper_aceptado_id", :null => false
    end
    create_table :bloqueados, :force => true, :id => false do |t|
      t.integer "swiper_bloquea_id", :null => false   
      t.integer  "swiper_bloqueado_id", :null => false
    end

    create_table :matchs, :force => true, :id => false do |t|
      t.integer "swiper_match_id", :null => false   
      t.integer  "swiper_matched_id", :null => false
    end

    create_table :reportados, :force => true do |t|
      t.integer "swiper_reporta_id", :null => false
      t.integer "swiper_reportado_id", :null => false
      t.string "contenido"
    end

    create_table :swipers_gustos, id: false do |t|
      t.references :swiper, index: true, foreign_key: true   
      t.references :gusto, index: true, foreign_key: true 
    end

    create_table :swipers_restaurantes, id: false do |t|
      t.references :swiper, index:true, foreign_key: true
      t.references :restaurante, index:true, foreign_key: true
    end
  end
end
