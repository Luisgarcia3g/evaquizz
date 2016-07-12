class AddtemaidTopreguntas < ActiveRecord::Migration
  def change
    add_column :preguntas, :temaid, :integer
  end
end
