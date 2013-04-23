class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :title, :null => false

      t.timestamps
    end
  end
end
