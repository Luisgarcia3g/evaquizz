class AddIndextotemas < ActiveRecord::Migration
  def change
     add_index :temas, :nombretema, unique: true, length: 767
  end
end
