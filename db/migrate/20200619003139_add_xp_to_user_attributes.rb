class AddXpToUserAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_attributes, :xp, :integer
  end
end
