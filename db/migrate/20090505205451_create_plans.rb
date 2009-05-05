class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name, :null => false, :limit => 32
      t.string :from_language, :null => false, :limit => 16, :default => "Any Language"
      t.string :to_language, :null => false, :limit => 16, :default => "Any Language"
      t.string :pricing, :null => false, :limit => 32
    end
    
    Plan.create :name => "Free", :from_language => "English", :pricing => "No Charge"
    Plan.create :name => "Pay-As-You-Go", :pricing => "$0.20/Translation"
    Plan.create :name => "Monthly Subscription", :pricing => "$3.99/Month for Unlimited Translations"
  end

  def self.down
    drop_table :plans
  end
end
