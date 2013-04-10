class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :null => false, :default => ''
      t.text :description, :null => false, :default => ''
      t.datetime :beginning, :null => false
      t.datetime :ending

      t.timestamps
    end
  end
end
