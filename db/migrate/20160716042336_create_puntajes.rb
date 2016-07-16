class CreatePuntajes < ActiveRecord::Migration
  def change
    create_table :puntajes do |t|
      t.string :codigo
      t.string :alumno
      t.string :string
      t.float :puntaje

      t.timestamps null: false
    end
  end
end
