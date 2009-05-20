class User < ActiveRecord::Base
  acts_as_authentic
  has_many :translations, :dependent => :destroy

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)  
  end

  def deliver_email_confirmation!  
    reset_perishable_token!
    Notifier.deliver_email_confirmation(self)  
  end  
end
