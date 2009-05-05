class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :s3_key, :null => false, :limit => 256
      t.boolean :is_vertical, :null => false, :default => 0
      t.column :uploaded_at, :datetime, :null => false
    end
  end

  def self.down
    drop_table :uploads
  end
end
