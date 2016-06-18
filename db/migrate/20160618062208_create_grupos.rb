class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :Nombre_grupo
      t.string :Maestro
      t.integer :Temario

      t.timestamps null: false
    end
  end
end
