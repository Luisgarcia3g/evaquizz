class AddIndextotemas < ActiveRecord::Migration
  def change
     add_index :temas, :nombretema, unique: true
  end
end
