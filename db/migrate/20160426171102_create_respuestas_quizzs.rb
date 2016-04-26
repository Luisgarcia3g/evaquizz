class CreateRespuestasQuizzs < ActiveRecord::Migration
  def change
    create_table :respuestas_quizzs do |t|
      t.integer :IdQR
      t.integer :Pregunta
      t.integer :Respuesta

      t.timestamps null: false
    end
  end
end
