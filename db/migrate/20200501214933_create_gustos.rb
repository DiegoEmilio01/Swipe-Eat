class CreateGustos < ActiveRecord::Migration[5.2]
  def change
    create_table :gustos do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
