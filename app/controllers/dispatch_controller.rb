class DispatchController < ApplicationController

  def home
    @user = current_user
    if @user
      redirect_to account_url
    end
  end
  
end
