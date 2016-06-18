class CreateResultados < ActiveRecord::Migration
  def change
    create_table :resultados do |t|
      t.string :Codigo
      t.string :Alumno

      t.timestamps null: false
    end
  end
end
