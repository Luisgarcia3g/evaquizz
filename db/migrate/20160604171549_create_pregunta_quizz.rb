class CreatePreguntaQuizz < ActiveRecord::Migration
  def change
    create_table :pregunta_quizz do |t|
      t.integer :quizz_id
      t.integer :pregunta_id
    end
  end
end
