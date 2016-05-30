class AddDescripciontotemas < ActiveRecord::Migration
  def change
      add_column :temas, :descripcion, :text
  end
end
