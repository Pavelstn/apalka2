class CreateOperations < ActiveRecord::Migration
  def self.up
    create_table :operations do |t|
      t.integer :user_id
      t.integer :message_id
      t.text :url
      t.text :msg
      t.integer :every
      t.float :price
      t.datetime :datetime

      t.timestamps
    end
  end

  def self.down
    drop_table :operations
  end
end
