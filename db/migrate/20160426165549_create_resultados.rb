class CreateResultados < ActiveRecord::Migration
  def change
    create_table :resultados do |t|
      t.integer :IdQR
      t.integer :Codigo
      t.integer :Alumno
      t.datetime :Hora

      t.timestamps null: false
    end
  end
end
