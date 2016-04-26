class CreateTemarios < ActiveRecord::Migration
  def change
    create_table :temarios do |t|
      t.integer :IdTemario
      t.text :Temas

      t.timestamps null: false
    end
  end
end
