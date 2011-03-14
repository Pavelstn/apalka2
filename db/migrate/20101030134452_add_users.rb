class AddUsers < ActiveRecord::Migration
  def self.up
    User.create(:name=>'firstuser', :password=>'qazqwert', :password_confirmation=>'qazqwert', :role=>'0')
  end

  def self.down
    User.delete_all
  end
end
