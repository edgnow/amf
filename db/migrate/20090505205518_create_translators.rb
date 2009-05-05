class CreateTranslators < ActiveRecord::Migration
  def self.up
    create_table :translators do |t|
      t.references :account, :null => false
      t.references :language, :null => false
    end
  end

  def self.down
    drop_table :translators
  end
end
