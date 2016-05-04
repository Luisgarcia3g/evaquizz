class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.text :texto
      t.text :respuesta1
      t.text :respuesta2
      t.text :respuesta3
      t.text :respuesta4
      t.integer :tiempo

      t.timestamps null: false
    end
  end
end
