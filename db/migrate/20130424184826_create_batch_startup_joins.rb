class CreateBatchStartupJoins < ActiveRecord::Migration
  def change
    create_table :batch_startup_joins do |t|
      t.references :batch
      t.references :startup
      t.timestamps
    end
  end
end
