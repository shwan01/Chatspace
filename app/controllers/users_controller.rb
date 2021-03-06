class UsersController < ApplicationController
  before_action :user_find, only: [:edit, :update]

  def index
    @users = User.where('name LIKE(?)', "#{params[:input]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:id, :name, :email, :password)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
