class CreateQuizzPregunta < ActiveRecord::Migration
  def change
    create_table :quizz_pregunta do |t|
      t.integer :IdQuizz
      t.integer :IdPregunta

      t.timestamps null: false
    end
  end
end
