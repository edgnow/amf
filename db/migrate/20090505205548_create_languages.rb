class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name, :null => false, :limit => 32
      t.string :code, :null => false, :limit => 8
    end

    Language.create :name => "English", :code => "en"
    Language.create :name => "Chinese", :code => "zh"
    Language.create :name => "Chinese Simplified", :code => "zh-CN"
    Language.create :name => "Chinese Traditional", :code => "zh-TW"
    Language.create :name => "Dutch", :code => "nl"
    Language.create :name => "French", :code => "fr"
    Language.create :name => "German", :code => "de"
    Language.create :name => "Greek", :code => "el"
    Language.create :name => "Italian", :code => "it"
    Language.create :name => "Japanese", :code => "ja"
    Language.create :name => "Korean", :code => "ko"
    Language.create :name => "Portuguese", :code => "pt-PT"
    Language.create :name => "Russian", :code => "ru"
    Language.create :name => "Spanish", :code => "es"

  end
    
  def self.down
    drop_table :languages
  end
end
