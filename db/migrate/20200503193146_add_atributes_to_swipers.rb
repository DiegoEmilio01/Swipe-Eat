class AddAtributesToSwipers < ActiveRecord::Migration[5.2]
  def change
    add_column :swipers, :nombre, :string
    add_column :swipers, :edad, :integer
    add_column :swipers, :telefono, :string
    add_column :swipers, :cumpleanos, :date
    add_column :swipers, :direccion, :string
    add_column :swipers, :descripcion, :string
  end
end
