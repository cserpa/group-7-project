# frozen_string_literal: true
class UsersController < ApplicationController
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
    # avatar = params[:user][:avatar]
    # @user.avatar = avatar
    # @user.save!
    if @user.update_attributes(user_params)
      flash[:notice] = 'User successfully updated'
      redirect_to user_path(@user)
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :first_name, :last_name,
                                                :avatar, :avatar_cache)
  end
end
