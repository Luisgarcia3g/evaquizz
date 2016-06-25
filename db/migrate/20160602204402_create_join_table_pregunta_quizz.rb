class CreateJoinTablePreguntaQuizz < ActiveRecord::Migration
  def change
    create_join_table :pregunta, :quizzs do |t|
      # t.index [:preguntum_id, :quizz_id]
      # t.index [:quizz_id, :preguntum_id]

      #Esto index me vinieron por defaul al crear la tabla
      #intente descomentarlos y cambiarlos por integers

    end
  end
end
