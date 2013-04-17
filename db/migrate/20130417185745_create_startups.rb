class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name, :null => false, :default => ''
      t.string :short_description, :null => false, :default => '', :limit => 100
      t.text :long_description, :null => false, :default => ''
      t.timestamps
    end
  end
end
