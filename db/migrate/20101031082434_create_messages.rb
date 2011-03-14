class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_id
      t.datetime :start
      t.datetime :stop
      t.integer :every
      t.text :url
      t.text :msg
      t.string :email
      t.string :phone
      t.string :login
      t.string :pass
      t.boolean :allowed

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
