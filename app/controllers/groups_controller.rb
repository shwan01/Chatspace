class GroupsController < ApplicationController
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

  private
  def group_params
    params.require(:group).permit(
      :name,
      user_ids: [],
      )
  end

end
