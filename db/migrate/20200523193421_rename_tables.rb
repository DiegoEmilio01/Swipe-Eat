class RenameTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :swipers_gustos, :gustos_swiper
    rename_table :swipers_restaurantes, :favorecidos

  end
end
