class AddIsActivetoQuizzs < ActiveRecord::Migration
  def change
    add_column :quizzs, :is_active, :boolean , :default => true
  end
end
