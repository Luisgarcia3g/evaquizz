class AddGrupoTopuntajes < ActiveRecord::Migration
  def change
    add_column :puntajes, :grupo_id, :integer

  end
end
