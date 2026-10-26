class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @artist_spaces = current_user.artist_spaces
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Dashboard updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy!
    redirect_to root_path, notice: "Account deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
