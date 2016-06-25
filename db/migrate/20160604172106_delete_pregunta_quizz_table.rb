class DeletePreguntaQuizzTable < ActiveRecord::Migration
  def change
    drop_table :pregunta_quizzs
  end
end
