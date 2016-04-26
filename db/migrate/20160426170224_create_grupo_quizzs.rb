class CreateGrupoQuizzs < ActiveRecord::Migration
  def change
    create_table :grupo_quizzs do |t|
      t.integer :Quizz
      t.datetime :HoraInicio
      t.text :Grupo
      t.integer :Codigo

      t.timestamps null: false
    end
  end
end
