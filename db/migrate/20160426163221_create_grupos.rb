class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.text :NombreGrupo
      t.text :Maestro
      t.integer :Temario

      t.timestamps null: false
    end
  end
end
