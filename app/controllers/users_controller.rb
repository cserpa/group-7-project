class UsersController < ApplicationController
  before_action :restrict_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'History no longer recognizes this user.'
    redirect_to root_path
  end

  protected

  def user_params
    params.require(:user).permit(
      :id,
      :email,
      :first_name,
      :last_name,
      :avatar,
      :avatar_cache,
      :role
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
