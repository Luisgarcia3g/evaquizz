class AddNameToQuizzs < ActiveRecord::Migration
  def change
    add_column :quizzs, :nombre, :string
  end
end
