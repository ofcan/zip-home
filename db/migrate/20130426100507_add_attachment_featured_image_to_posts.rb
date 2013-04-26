class AddAttachmentFeaturedImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    drop_attached_file :posts, :featured_image
  end
end
