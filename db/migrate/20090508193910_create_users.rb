class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      
      t.string :email, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.boolean :active, :null => false, :default => 0
      
      t.references :plan, :null => false
      t.integer :points, :null => false, :default => 0
      t.decimal :balance, :null => false, :default => 0, :precision => 4, :scale => 2
      
      t.string :current_login_ip
      t.string :last_login_ip
      t.datetime :last_login_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
