class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuesta do |t|
      t.integer :IdPreguntaR
      t.text :Texto
      t.boolean :Correcta

      t.timestamps null: false
    end
  end
end
