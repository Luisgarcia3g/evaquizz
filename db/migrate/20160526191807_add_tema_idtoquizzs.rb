class AddTemaIdtoquizzs < ActiveRecord::Migration
  def change
    add_column :quizzs, :temaid, :integer
  end
end
