class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.references :user, :null => false
      t.references :plan, :null => false
      t.string :cc_num, :null => false, :limit => 64
      t.string :cc_expire, :null => false, :limit => 64
      t.string :cc_code, :null => false, :limit => 64
      t.integer :points, :null => false, :default => 0
      t.decimal :balance, :null => false, :default => 0, :precision => 4, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
