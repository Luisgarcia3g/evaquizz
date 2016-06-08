class AddIsActivetoPreguntas < ActiveRecord::Migration
  def change
    add_column :preguntas, :is_active, :boolean , :default => true
  end
end
