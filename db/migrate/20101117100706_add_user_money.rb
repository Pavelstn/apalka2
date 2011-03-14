class AddUserMoney < ActiveRecord::Migration
  def self.up
  add_column :users, :money, :float
  end

  def self.down
  remove_column :users, :money
  end
end
