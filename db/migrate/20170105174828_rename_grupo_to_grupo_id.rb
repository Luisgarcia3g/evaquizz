class RenameGrupoToGrupoId < ActiveRecord::Migration
  def change
     rename_column :grupoquizzs, :Quizz, :quizz_id
  end
end
