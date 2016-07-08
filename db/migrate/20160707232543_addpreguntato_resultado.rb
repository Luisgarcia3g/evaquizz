class AddpreguntatoResultado < ActiveRecord::Migration
  def change

    add_column :resultados, :pregunta, :integer
  end
end
