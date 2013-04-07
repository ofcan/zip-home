# Generated this migration with command:
# rails g migration AddAdminToUsers admin:boolean

class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :null => false, :default => false
  end
end
