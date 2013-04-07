# Generated this migration with command:
# rails g migration AddUsernameToUsers username:string

class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, :null => false, :default => ''
  end
end
