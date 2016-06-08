class AddIsActivetoTemas < ActiveRecord::Migration
  def change
      add_column :temas, :is_active, :boolean , :default => true
  end
end
