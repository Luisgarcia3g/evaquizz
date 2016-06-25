class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.text :nombretema
      t.integer :quizz
      t.integer :temario

      t.timestamps null: false
    end
  end
end
