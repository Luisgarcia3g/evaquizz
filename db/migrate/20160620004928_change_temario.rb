class ChangeTemario < ActiveRecord::Migration
  def change
    rename_column :grupos, :Temario, :temarioid
  end
end
