class AddImagetoPregunta < ActiveRecord::Migration
  def change
    add_column :pregunta, :image, :string
  end
end
