class AddiniciadotoGrupoQuizzs < ActiveRecord::Migration
  def change
       add_column :grupo_quizzs, :iniciado, :boolean
  end
end
