class AddNombretotemarios < ActiveRecord::Migration
  def change
    add_column :temarios, :nombretemario, :string
  end
end
