class CreateCcTypes < ActiveRecord::Migration
  def self.up
    create_table :cc_types do |t|
      t.string :name, :null => false, :limit => 16
    end
    
    CcType.create :name => "Visa"
    CcType.create :name => "Master Card"
    CcType.create :name => "American Express"
    CcType.create :name => "Discover"
  end

  def self.down
    drop_table :cc_types
  end
end
