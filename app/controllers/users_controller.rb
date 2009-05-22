class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
    @plan = Plan.find(params[:id])    
    @options = get_options(@plan.min, @plan.max)
  end
  
  def create
    @user = User.new(params[:user])
    
    @plan = Plan.find(params[:plan_id])
    if @user.save
      @pass = Pass.new
      @pass.user = @user
      @pass[@plan.unit.downcase + 's'] = params[:units].to_i
      @pass.save
      
      @user.deliver_email_confirmation!
      flash[:notice] = "An activation link has been sent to your email account.  In order to complete your registration, 
      please open the email and click on the activation link. Thank you for registering with BabelCell!"
      redirect_back_or_default :controller => 'dispatch', :action => 'home'
    else
      @options = get_options(@plan.min, @plan.max)
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

private
  
  def get_options(min, max)
    options = ''
    for i in (min .. max)
      options = options + '<option>' + i.to_s + '</option>'
    end
    return options
  end

end

