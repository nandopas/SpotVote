class DropFitsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :fits
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
