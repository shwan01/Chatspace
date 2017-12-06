class ChatsController < ApplicationController
  before_action :group_find, only: [:index, :create]

  def index
    @groups = current_user.groups
    @chats = @group.chats.order("created_at ASC").includes(:user)
    @chat = Chat.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.group_id = params[:group_id]
    respond_to do |format|
      if @chat.save
        format.html { render :index  }
        format.json
        flash.now[:notice] = "チャットを送信しました"
      else
      render :index
      flash.now[:alert] = "メッセージを入力してください"
      end
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :image)
    end

    def group_find
      @group = Group.find(params[:group_id])
    end
end
