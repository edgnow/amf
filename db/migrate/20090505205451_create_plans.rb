class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :name, :null => false, :limit => 32
      t.string :from_language, :null => false, :limit => 16, :default => "Any Language"
      t.string :to_language, :null => false, :limit => 16, :default => "Any Language"
      t.decimal :price, :null => false, :precision => 3, :scale => 2
      t.string :unit, :null => false, :limit => 16
      t.string :notes, :null => false
      t.integer :min, :null => false
      t.integer :max, :null => false
    end
    
    Plan.create :name => "Free",
                :from_language => "English",
                :price => 0,
                :unit => "",
                :notes => "<ul>
                            <li>Unlimited translations from English to any other language.</li>
                            <li>Sign up is <b>optional</b>.</li>
                          </ul>",
                :min => 0,
                :max => 0
                
    Plan.create :name => "Pay-As-You-Go",
                :price => 0.15,
                :unit => "Translation",
                :notes => "<ul>
                            <li>Pre-Pay for a limited number of translations to be used whenever you want.</li>
                            <li>Note: Minimum purchase is 5 translations.</li>
                          </ul>",
                :min => 5,
                :max => 20
                
    Plan.create :name => "Day Pass",
                :price => 1.50,
                :unit => "Day",
                :notes => "<ul>
                            <li>Pay for as many days as you want.</li>
                            <li>Unlimited translations for the days that you pay for.</li>
                          </ul>",
                :min => 1,
                :max => 30
                
    Plan.create :name => "Week Pass",
                :price => 4.50,
                :unit => "Week",
                :notes => "<ul>
                            <li>Pay for as many weeks as you want.</li>
                            <li>Unlimited translations for the weeks that you pay for.</li>
                          </ul>",
                :min => 1,
                :max => 16
  end

  def self.down
    drop_table :plans
  end
end
