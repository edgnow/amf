class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.references :user, :null => false
      t.string :s3_key, :null => false, :limit => 256
      t.boolean :vertical, :null => false, :default => 0
      t.references :start_language, :null => false
      t.references :end_language, :null => false
      t.string :start_text, :null => false
      t.string :end_text
      t.column :uploaded_at, :datetime, :null => false
      t.column :translated_at, :datetime, :null => false 
    end
  end

  def self.down
    drop_table :translations
  end
end
