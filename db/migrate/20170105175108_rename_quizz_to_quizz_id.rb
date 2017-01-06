class RenameQuizzToQuizzId < ActiveRecord::Migration
  def change
    rename_column :grupoquizzs, :Grupo, :grupo_id
  end
end
