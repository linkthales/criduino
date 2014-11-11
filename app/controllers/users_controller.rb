class UsersController < ApplicationController
  before_filter :require_no_authentication, :only => [:new, :create]
  before_filter :can_change, :only => [:edit, :update]

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
	if @user.save
	  SignupMailer.confirm_email(@user).deliver
	  redirect_to @user, :notice => I18n.t('users.new.success')
	else
	  render :new
	end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	  redirect_to @user, :notice => I18n.t('users.edit.success')
	else
	  render :edit
	end
  end
  
  private
	
  def can_change
	  unless user_signed_in? && current_user == user
		redirect_to user_path(params[:id])
	  end
  end
	
  def user
	@user ||= User.find(params[:id])
  end
end