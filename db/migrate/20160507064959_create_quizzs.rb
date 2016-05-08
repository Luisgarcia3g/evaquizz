class CreateQuizzs < ActiveRecord::Migration
  def change
    create_table :quizzs do |t|
      t.integer :pregunta
      t.boolean :disponible
      t.text :tema

      t.timestamps null: false
    end
  end
end
