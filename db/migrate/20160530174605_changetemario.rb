class Changetemario < ActiveRecord::Migration
  def change
    rename_column :temas, :temario, :temarioid
  end
end
