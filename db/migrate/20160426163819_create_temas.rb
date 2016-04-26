class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.text :NombreTema
      t.integer :Quizz
      t.integer :Temario

      t.timestamps null: false
    end
  end
end
