class CreateComunas < ActiveRecord::Migration[5.2]
  def change
    create_table :comunas do |t|
      t.string :nombre
      t.boolean :cuarentena

      t.timestamps
    end
  end
end
