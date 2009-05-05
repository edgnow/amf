class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.references :user, :null => false
      t.string :invite_key, :null => false, :limit => 64
      t.column :expiration, :date, :null => false
      t.column :created_at, :datetime, :null => false
    end
  end

  def self.down
    drop_table :registrations
  end
end
