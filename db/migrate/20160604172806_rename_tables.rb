class RenameTables < ActiveRecord::Migration
  def change
    rename_table :pregunta, :preguntas
    rename_table :pregunta_quizz, :pregunta_quizzs
  end
end
