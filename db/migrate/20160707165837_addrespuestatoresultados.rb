class Addrespuestatoresultados < ActiveRecord::Migration
  def change
    add_column :resultados, :respuesta, :integer
  end
end
