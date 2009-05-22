class CreatePasses < ActiveRecord::Migration
  def self.up
    create_table :passes do |t|
      t.references :user, :null => false
      t.integer :points, :null => false, :default => 0
      t.integer :translations, :null => false, :default => 0
      t.integer :days, :null => false, :default => 0
      t.integer :weeks, :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :passes
  end
end
