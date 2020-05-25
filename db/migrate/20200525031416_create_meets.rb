class CreateMeets < ActiveRecord::Migration[5.2]
  def change

    create_table :meets do |t|
      t.integer :swiper_cita_id, :null => false
      t.integer :swiper_citado_id, :null => false
      t.boolean :estado
      t.timestamp :fecha

      t.timestamps
    end
  end
end
