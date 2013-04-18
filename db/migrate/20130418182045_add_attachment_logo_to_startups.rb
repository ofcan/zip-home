# migration generated with command
# rails generate paperclip startup logo

class AddAttachmentLogoToStartups < ActiveRecord::Migration
  def self.up
    change_table :startups do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :startups, :logo
  end
end
