class CreateQuizzs < ActiveRecord::Migration
  def change
    create_table :quizzs do |t|
      t.integer :IdQuizz
      t.text :Pregunta
      t.boolean :Disponible
      t.texto :Tema

      t.timestamps null: false
    end
  end
end
