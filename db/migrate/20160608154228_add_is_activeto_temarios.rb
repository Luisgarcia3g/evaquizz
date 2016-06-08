class AddIsActivetoTemarios < ActiveRecord::Migration
  def change
      add_column :temarios, :is_active, :boolean , :default => true
  end
end
