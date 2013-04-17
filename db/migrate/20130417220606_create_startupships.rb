class CreateStartupships < ActiveRecord::Migration
  def change
    create_table :startupships do |t|
      t.references :user
      t.references :startup
      t.timestamps
    end
  end
end
