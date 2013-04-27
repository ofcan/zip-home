class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :commentable, :polymorphic => true
      t.text :body, :null => false
      t.timestamps
    end
  end
end
