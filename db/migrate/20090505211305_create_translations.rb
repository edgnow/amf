class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.references :account, :null => false
      t.references :start_language, :null => false
      t.references :end_language, :null => false
      t.references :upload
      t.string :start_text, :null => false
      t.string :end_text
      t.column :translated_at, :datetime, :null => false 
    end
  end

  def self.down
    drop_table :translations
  end
end
