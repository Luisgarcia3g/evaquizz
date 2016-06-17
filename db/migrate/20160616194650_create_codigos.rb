class CreateCodigos < ActiveRecord::Migration
  def change
    create_table :codigos do |t|
      t.string :codigo

      t.timestamps null: false
    end
  end
end
