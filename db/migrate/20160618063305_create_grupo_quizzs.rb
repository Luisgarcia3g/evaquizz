class CreateGrupoQuizzs < ActiveRecord::Migration
  def change
    create_table :grupo_quizzs do |t|
      t.datetime :Hora
      t.integer :Quizz
      t.integer :Grupo
      t.string :Codigo

      t.timestamps null: false
    end
  end
end
