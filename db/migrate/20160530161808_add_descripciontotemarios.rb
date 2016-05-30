class AddDescripciontotemarios < ActiveRecord::Migration
  def change
    add_column :temarios, :descripcion, :text
  end
end
