# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authorize_user, except: [:show, :edit, :update]
  before_action :restrict_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = 'User successfully updated'
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      redirect_to edit_user_path(@user)
    end
  end
  def destroy
    
  protected

  def user_params
    params.require(:user).permit(
      :id,
      :email,
      :first_name,
      :last_name,
      :avatar,
      :avatar_cache
    )
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def restrict_user
    if current_user.id != params[:id].to_i && !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
