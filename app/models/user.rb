class User < ActiveRecord::Base
  acts_as_authentic
  has_one :account, :dependent => :destroy
  has_one :plan, :through => :account
  has_many :languages, :through => :account
  has_many :translations, :through => :account
  has_many :uploads, :through => :account

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)  
  end

  def deliver_email_confirmation!  
    reset_perishable_token!
    Notifier.deliver_email_confirmation(self)  
  end  
  
end
