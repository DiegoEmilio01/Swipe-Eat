class CreateTableAcepta < ActiveRecord::Migration[5.2]
  def change
    create_table :swipers_acepta, :force => true do |t|
      t.integer "swiper_acepta_id", :null => false   
      t.integer  "swiper_aceptado_id", :null => false
    end
  end
end
