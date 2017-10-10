class UsersController < ApplicationController
  def user_find
    @user = User.find(params[:id])
  end

  def edit
    user_find
  end

  def update
    user_find
    if @user.update_attributes(user_params)
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password)
  end
end
