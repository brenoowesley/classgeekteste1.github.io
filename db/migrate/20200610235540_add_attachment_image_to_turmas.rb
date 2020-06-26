class AddAttachmentImageToTurmas < ActiveRecord::Migration[6.0]
  def self.up
    change_table :turmas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :turmas, :image
  end
end
