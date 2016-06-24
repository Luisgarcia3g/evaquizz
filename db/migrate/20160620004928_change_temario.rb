class ChangeTemario < ActiveRecord::Migration
  def change
    rename_column :grupo, :Temario, :temarioid
  end
end
