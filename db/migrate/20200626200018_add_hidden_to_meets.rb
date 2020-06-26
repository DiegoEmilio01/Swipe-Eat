class AddHiddenToMeets < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :meets, :hidden
      remove_column :meets, :hidden
    end
    add_column :meets, :hidden, :boolean
  end
end
