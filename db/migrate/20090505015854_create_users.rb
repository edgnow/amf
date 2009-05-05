class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false, :limit => 16
      t.string :first_name, :null => false, :limit => 16
      t.string :last_name, :null => false, :limit => 16
      t.string :hashed_password, :null => false, :limit => 64
      t.string :salt, :null => false, :limit => 8
      t.boolean :active, :default => 0, :null => false
      t.column :last_login_at, :datetime, :null => false
      t.column :created_at, :datetime, :null => false

    end
  end

  def self.down
    drop_table :users
  end
end
