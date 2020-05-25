class RenameReportadosTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :reportados, :reportes
  end
end
