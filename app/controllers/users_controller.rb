class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password)
  end
end
