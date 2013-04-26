class AddAttachmentFeaturedImageToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    drop_attached_file :events, :featured_image
  end
end
