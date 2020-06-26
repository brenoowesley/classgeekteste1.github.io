class CreateUserAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_attributes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :hp
      t.integer :mana
      t.integer :money
      t.integer :level

      t.timestamps
    end
  end
end
