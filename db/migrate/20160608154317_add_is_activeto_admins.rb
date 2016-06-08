class AddIsActivetoAdmins < ActiveRecord::Migration
  def change
      add_column :admins, :is_active, :boolean , :default => true
  end
end
