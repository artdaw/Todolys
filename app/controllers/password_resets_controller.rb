class PasswordResetsController < ApplicationController

  before_filter :require_no_user, :load_user_using_perishable_token, :only => [:edit, :update]

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user
      @user.reset_perishable_token!
      Notifier.password_reset_instructions(@user, edit_password_reset_url(@user.perishable_token)).deliver
      flash[:notice] = "Instructions to reset your password have been emailed to you. " +
          "Please check your email."
      redirect_to root_url
    else
      @user = User.new
      @user.errors.add(:no_user, " was found with that email address")
      render :action => :new
    end
  end

  def edit
    @user = User.find_using_perishable_token(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to lists_path
    else
      render :action => :edit
    end
  end

  private
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = "We're sorry, but we could not locate your account. " +
          "If you are having issues try copying and pasting the URL " +
          "from your email into your browser or restarting the " +
          "reset password process."
      redirect_to root_url
    end
  end

end
