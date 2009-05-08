class DispatchController < ApplicationController

  def home
    @user = current_user
    if @user
      redirect_to account_url
    end
  end
  
  def pricing
    @plans = Plan.all
  end
  
  def guides
    
  end
  
  def feedback
    
  end
  
end
