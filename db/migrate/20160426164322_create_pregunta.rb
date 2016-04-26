class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.integer :IdPregunta
      t.text :TextoPregunta
      t.binary :Imagen

      t.timestamps null: false
    end
  end
end
