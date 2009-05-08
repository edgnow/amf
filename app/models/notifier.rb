class Notifier < ActionMailer::Base
  default_url_options[:host] = "0.0.0.0:3001"  
   
  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "support@babelcell.com"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => url_for(:controller => "password_resets", :action => "edit", :id => user.perishable_token)  
  end  

  def email_confirmation(user)  
    subject       "Email Confirmation"
    from          "support@babelcell.com"
    recipients    user.email
    sent_on       Time.now
    body          :confirm_users_url => url_for(:controller => "users", :action => "confirm", :id => user.perishable_token)  
  end
  
end
