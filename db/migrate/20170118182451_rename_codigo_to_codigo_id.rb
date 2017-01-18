class RenameCodigoToCodigoId < ActiveRecord::Migration
  def change
    rename_column :grupoquizzs, :Codigo, :codigo_id
  end
end
