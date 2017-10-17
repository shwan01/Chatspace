class GroupsController < ApplicationController
  before_action :group_find, only: [:edit, :update]
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループが作成されました'
    else
      render :new, alert: 'グループ作成に失敗しました'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループが編集されました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(
      :name,
      user_ids: [],
      )
  end

  def group_find
    @group = Group.find(params[:id])
  end
end
