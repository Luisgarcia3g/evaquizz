class RemoveTemaFromQuizzs < ActiveRecord::Migration
  def change
    remove_column :quizzs, :tema, :text
  end
end
