class AddAttachmentBeardPhotoToPirates < ActiveRecord::Migration
  def self.up
    change_table :pirates do |t|
      t.attachment :beard_photo
    end
  end

  def self.down
    drop_attached_file :pirates, :beard_photo
  end
end
