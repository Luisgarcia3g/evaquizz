class CreateTemarios < ActiveRecord::Migration
  def change
    create_table :temarios do |t|
      t.text :temas

      t.timestamps null: false
    end
  end
end
