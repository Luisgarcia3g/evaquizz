class RenameGrupoQuizztoGrupoquizzs < ActiveRecord::Migration
  def change
     rename_table :grupo_quizzs, :grupoquizzs
  end
end
