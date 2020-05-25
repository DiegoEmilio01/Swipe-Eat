class AddIndexToReportados < ActiveRecord::Migration[5.2]
  def change
    drop_table :reportados
    
    create_table :reportados, :force => true do |t|
      t.integer "swiper_reporta_id", :null => false, index: true
      t.integer "swiper_reportado_id", :null => false, index: true
      t.string "contenido"
    end
  end
end
