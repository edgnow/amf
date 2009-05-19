class CreateCreditCards < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|
      t.references :user, :null => false
      t.references :cc_type, :null => false
      
      t.string :salt, :null => false, :limit => 32
      t.string :number, :null => false, :limit => 64
      t.string :month, :null => false, :limit => 64
      t.string :year, :null => false, :limit => 64
      t.timestamps
    end
  end

  def self.down
    drop_table :credit_cards
  end
end
