class AddNombreToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :nombre, :string
  end
end
