class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
    @plan = Plan.find(params[:id])
    @options = ''
    for i in (@plan.min .. @plan.max)
      @options = @options + '<option>' + i.to_s + '</option>'
    end
  end
  
  def create
    @user = User.new(params[:user])
    
    if params[:plan_id]
      @plan = Plan.find(params[:plan_id])
      @user[@plan.user_field] = params[:units].to_i * @plan.multiplier
    end
    
    if @user.save
      @user.deliver_email_confirmation!
      flash[:notice] = "An activation link has been sent to your email account.  In order to complete your registration, 
      please open the email and click on the activation link. Thank you for registering with BabelCell!"
      redirect_back_or_default :controller => 'dispatch', :action => 'home'
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end
 
  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def confirm
    load_user_using_perishable_token
    @user.active = true
    @user.save
    flash[:notice] = "Account has been activated!  You may now login!"
    redirect_to :controller => "user_sessions", :action => "new"
  end
end
