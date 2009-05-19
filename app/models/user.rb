class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :plan
  has_one :credit_card
  has_many :translations, :dependent => :destroy

  accepts_nested_attributes_for :credit_card, :allow_destroy => true  

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)  
  end

  def deliver_email_confirmation!  
    reset_perishable_token!
    Notifier.deliver_email_confirmation(self)  
  end  
end
