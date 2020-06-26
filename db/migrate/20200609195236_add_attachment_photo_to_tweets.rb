class AddAttachmentPhotoToTweets < ActiveRecord::Migration[6.0]
  def self.up
    change_table :tweets do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :tweets, :photo
  end
end
